const waterfall = require('async/waterfall')
const path = require('path')
const fs = require('fs')

const verifyEmailPage = fs.readFileSync(path.join(__dirname, '../views/verifyEmail.html'), 'utf8')

const User = require('../models/User')
const { hash } = require('../helpers/sha512')
const jwt = require('../helpers/jwt')
const Session = require('../models/Session')
const { sendEmail } = require('../helpers/email')

module.exports.register = (req, res) => {
    waterfall([
        function hashPassword(next) {
            if (req.body.password) {
              req.body.password = hash(req.body.password)
            }
            next(null)
          },
          function signJWT(next) {
            const data = { ...req.body }
            delete data.password
      
            jwt.sign(data, (error, token) => {
              if (error) {
                next(error)
              } else {
                req.body.token = token
                next(null)
              }
            })
          },
        function insertUser(next) {
            User.create({ ...req.body, isAdmin: 0, sudahAktif: 0})
                .then((_res) => {
                    next(null, _res)
                })
                .catch((error) => {
                  console.log(error.message)
                    next(error)
                })
        },
        function sendVerificationEmail(insertedData, next) {
          const link = process.env.FE_URL + '/verify?token=' + req.body.token
          const text = "Please visit this link to verify your email address : " + link
          const html = verifyEmailPage.replace('##link##', link)
          sendEmail(req.body.email, 'Email Verification', text, html)
            .then((_res) => {
              next(null, insertedData)
            })
            .catch((error) => {
              next(error)
            })
        }

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

  module.exports.checkToken = (req, res) => {
    jwt.verify(req.query.token, (err, data) => {
      if (err) {
        res.status(500).send(err.message)
      } else {
        User.findOne({ where: { token: req.query.token } })
          .then((currentUser) => {
            if (currentUser) {
              return currentUser.update({ token: null, sudahAktif: true })
            } else {
              res.status(400).send('Invalid Token')
            }
          })
          .then((_res) => {
            res.send('OK')
          })
          .catch((error) => {
            res.status(500).send(error)
          })
      }
    })
  }
  module.exports.logout = (req, res) => {
    req.currentSession.destroy()
      .then((_res) => {
        res.send('OK')
      })
      .catch((error) => {
        res.status(500).send(error)
      })
  }
  