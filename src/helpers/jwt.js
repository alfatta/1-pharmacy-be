const jwt = require('jsonwebtoken')
// const fs = require('fs')
// const path = require('path')

// const private = fs.readFileSync(path.join(__dirname, '../config/private.pem'))
// const public = fs.readFileSync(path.join(__dirname, '../config/public.pem'))

module.exports.sign = (data, cb) => {
  // jwt.sign(data, private, { algorithm: 'RS512', expiresIn: '1d' }, cb)
  jwt.sign(data, process.env.SECRET_KEY, { expiresIn: '1d' }, cb)
}

module.exports.verify = (token, cb) => {
  // jwt.verify(token, public, { algorithms: 'RS512' }, cb)
  jwt.verify(token, process.env.SECRET_KEY, cb)
}