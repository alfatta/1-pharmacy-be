const express = require('express')

const route = express.Router()

const authController = require('../controllers/auth')


route.post('/auth/register', authController.register)
route.post('/auth/login', authController.login)
route.get('/auth/verify', authController.checkToken)

module.exports = route