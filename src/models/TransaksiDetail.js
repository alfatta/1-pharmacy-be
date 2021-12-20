const { DataTypes } = require('sequelize')
const db = require('../helpers/db')
const Transaksi = require('./Transaksi')
const Obat = require('./Obat')

const TransaksiDetail = db.define('transaksidetail', {
    idTransaksiDetail: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    hargaObat:{
        type: DataTypes.INTEGER,
        allowNull: false 
    },
    idObat: {
        type: DataTypes.INTEGER,
        allowNull: false
      },
    idTransaksi: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    qty: {
      type: DataTypes.INTEGER,
      allowNull: false
  },
  }, {
    freezeTableName: true,
    timestamps:false
  }) 
  TransaksiDetail.belongsTo(Obat,{foreignKey:'idObat'}) 
  TransaksiDetail.belongsTo(Transaksi,{foreignKey:'idTransaksi'}) 
  module.exports = TransaksiDetail