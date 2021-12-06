const jwt = require('../helpers/jwt')
const Session = require('../models/Session')
const User = require('../models/User')

module.exports.checkAuth = (req, res, next) => {
  if (!req.headers.token) {
    res.status(401).send('Unauthorized')
  } else {
    jwt.verify(req.headers.token, (err, data) => {
      if (err) {
        res.status(401).send('Unauthorized')
      } else {
        req.currentRole = data.isAdmin ? 'admin' : 'user'
        Session.findOne({where: { tokenSession: req.headers.token}})
          .then((_res) => {
            if (_res) {
              req.currentSession = _res
              return User.findByPk(_res.idUser)
            }
          })
          .then((_res) => {
            if (_res) {
              req.currentUser = _res
              next()
            } else {
              res.status(401).send('Unauthorized')
            }
          })
          .catch((err) => {
            res.status(500).send(err.message)
          })
      }
    })
  }
}
