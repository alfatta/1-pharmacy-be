const waterfall = require('async/waterfall')



const Category = require('../models/Kategori')



module.exports.getAllCategory = (req, res) => {
    waterfall([
        function getAllData(next){
            Category.findAll()
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
module.exports.getCategory = (req, res) => {
    waterfall([
        function getData(next){
            Category.findByPk(req.params.id)
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

module.exports.addCategory = (req, res) => {
    waterfall([
        function addData(next){
            Category.create(req.body)
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

module.exports.updateCategory = (req, res) => {
    waterfall([
        function addData(next){
            Category.findByPk(req.params.id)
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



module.exports.deleteCategory = (req, res) => {
    waterfall([
        function addData(next){
            Category.findByPk(req.params.id)
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