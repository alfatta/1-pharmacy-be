const express = require('express')

const route = express.Router()

const authController = require('../controllers/auth')

const categoryController = require('../controllers/category')

const authMiddleware = require('../middlewares/auth')

const productController = require('../controllers/product')

const transactionController = require('../controllers/transaction')

const uploadController = require('../controllers/upload')


route.post('/auth/register', authController.register)
route.post('/auth/login', authController.login)
route.get('/auth/verify', authController.checkToken)
route.post('/auth/logout',authMiddleware.checkAuth, authController.logout)
route.get('/category', categoryController.getAllCategory)
route.get('/category/:id',categoryController.getCategory)
route.post('/category', categoryController.addCategory)
route.patch('/category/:id', categoryController.updateCategory)
route.delete('/category/:id', categoryController.deleteCategory)
route.get('/product', productController.getAllProduct)
route.get('/product/:id',productController.getProduct)
route.post('/product', productController.addProduct)
route.patch('/product/:id', productController.updateProduct)
route.delete('/product/:id', productController.deleteProduct)
route.post('/transaction',authMiddleware.checkAuth,transactionController.createTransaction)
route.get('/transaction', transactionController.getTransaction)
route.post('/upload', uploadController.single('image'), (req, res) => {
    res.send(`${process.env.API_URL}/${req.file.path}`)
})
route.patch('/transaction/:id', transactionController.updateTransaction)
route.get('/transaction/user/', authMiddleware.checkAuth, transactionController.getTransactionByUser)
module.exports = route