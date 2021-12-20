const waterfall = require('async/waterfall')

const Transaksi = require('../models/Transaksi')
const TransaksiDetail = require('../models/TransaksiDetail')
const moment = require('moment')
const User = require('../models/User')

module.exports.createTransaction = (req, res) => {
    waterfall([
        function calculateTransaction(next){
            req.totalTransaction = req.body.items.reduce((acc, item) => acc + item.qty * item.hargaObat, 0)
            next()
        },
        function createTransactionData(next){
            const transaksi = {
                tanggalTransaksi : moment().format('YYYY-MM-DD'),
                hargaKeseluruhan : req.totalTransaction,
                buktiPembayaran : "",
                statusTransaksi : 1,
                idUser : req.currentUser.idUser,
            }
            Transaksi.create(transaksi)
            .then((_res) => {
                next(null,JSON.parse(JSON.stringify(_res)))
            })
            .catch((error) => {
                console.log(error.message)
                  next(error)
              })
        },
        function createTransactionDetailData(transaksi, next){
            const items = req.body.items.map((item) =>{
                item.idTransaksi = transaksi.idTransaksi
                return item
            })
            console.log(items, transaksi)
            TransaksiDetail.bulkCreate(items)
            .then((_res) => {
                next(null, {...transaksi,items : _res})
            })
            .catch((error) => {
                console.log(error.message)
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

module.exports.getTransaction = (req, res) => {
    waterfall([
        function getTransactionData(next){
            const page = parseInt(req.query.page) || 1
            const perPage = parseInt(req.query.perPage) || 20
            const offset = (page - 1)*perPage
            const limit = perPage
            Transaksi.findAndCountAll({
                include: [
                    {
                        model: TransaksiDetail
                    },
                    {
                        model : User
                    }
                ],
                offset,
                limit,
            })
            .then((_res) => {
                const totalPage = Math.ceil(_res.count/perPage)
                const data = {
                    ..._res,
                    totalPage,
                    nextPage : page<totalPage ? page+1 : null,
                    previousPage: page > 1 ? page-1 : null,
                }
                next(null, data)
            })
            .catch((error) => {
              console.log(error.message)
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