const express = require('express')

const route = express.Router()

const authController = require('../controllers/auth')

const authMiddleware = require('../middlewares/auth')


route.post('/auth/register', authController.register)
route.post('/auth/login', authController.login)
route.get('/auth/verify', authController.checkToken)
route.post('/auth/logout',authMiddleware.checkAuth, authController.logout)

module.exports = route