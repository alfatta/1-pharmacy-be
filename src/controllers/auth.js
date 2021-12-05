const waterfall = require('async/waterfall')
const path = require('path')
const fs = require('fs')

const User = require('../models/User')
const { hash } = require('../helpers/sha512')
const jwt = require('../helpers/jwt')
const Session = require('../models/Session')

module.exports.register = (req, res) => {
    waterfall([
        function hashPassword(next) {
            if (req.body.password) {
              req.body.password = hash(req.body.password)
            }
            next(null)
          },
        function insertUser(next) {
            User.create({ ...req.body, isAdmin: 0, token : "", sudahAktif: 1})
                .then((_res) => {
                    next(null, _res)
                })
                .catch((error) => {
                    next(error)
                })
        },

    ],
        function (error, result) {
            if (error) {
                res.status(500).send(error)
            } else {
                res.send(result)
            }
        }
    )

}

module.exports.login = (req, res) => {
    User.findOne({ where: {
      email: req.body.email,
      password: hash(req.body.password),
    }})
      .then((currentUser) => {
        if (currentUser) {
          if (currentUser.sudahAktif) {
                const data = {
                  name: currentUser.name,
                  email: currentUser.email,
                  isAdmin: currentUser.isAdmin
                }
                jwt.sign(data, (error, token) => {
                    if (error) {
                      res.status(500).send(error)
                    } else {
                      Session.create({
                        tokenSession : token,
                        idUser: currentUser.idUser
                      })
                      const user = currentUser.get()
                      delete user.password
                      res.send({ token, user })
                    }
                  })
          } else {
            res.status(400).send('Account inactive')
          }
        } else {
          res.status(400).send('Invalid email or password')
        }
      })
  }