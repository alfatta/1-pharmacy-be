const CryptoJs = require('crypto-js')

module.exports.hash = (message) => {
  return CryptoJs.HmacSHA512(message, process.env.SECRET_KEY).toString()
}