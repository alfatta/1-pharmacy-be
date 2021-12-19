const waterfall = require('async/waterfall')



const Obat = require('../models/Obat')
const Kategori = require('../models/Kategori')



module.exports.getAllProduct = (req, res) => {
    waterfall([
        function getAllData(next){
            const page = parseInt(req.query.page) || 1
            const perPage = parseInt(req.query.perPage) || 20
            const offset = (page - 1)*perPage
            const limit = perPage
            Obat.findAndCountAll({
                include: [{
                    model: Kategori
                }],
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
module.exports.getProduct = (req, res) => {
    waterfall([
        function getData(next){
            Obat.findByPk(req.params.id, {
                include: [{
                    model: Kategori
                }],
            })
            .then((_res) => {
                next(null, _res)
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

module.exports.addProduct = (req, res) => {
    waterfall([
        function addData(next){
            Obat.create(req.body)
                .then((_res) => {
                    next(null, _res)
                })
                .catch((error) => {
                  console.log(error.message)
                    next(error)
                })
        }],
    function (error, result) {
        if (error) {
            res.status(500).send(error)
        } else {
            res.send(result)
        }
    }
    )
}

module.exports.updateProduct = (req, res) => {
    waterfall([
        function updateData(next){
            Obat.findByPk(req.params.id)
                .then((_res) => {
                    return _res.update(req.body)
                })
                .then((_res) => {
                    next(null, _res)
                })
                .catch((error) => {
                  console.log(error.message)
                    next(error)
                })
        }],
    function (error, result) {
        if (error) {
            res.status(500).send(error)
        } else {
            res.send(result)
        }
    }
    )
}



module.exports.deleteProduct = (req, res) => {
    waterfall([
        function deleteData(next){
            Obat.findByPk(req.params.id)
                .then((_res) => {
                    return _res.destroy()
                })
                .then((_res) => {
                    next(null, _res)
                })
                .catch((error) => {
                  console.log(error.message)
                    next(error)
                })
        }],
    function (error, result) {
        if (error) {
            res.status(500).send(error)
        } else {
            res.send(result)
        }
    }
    )
}