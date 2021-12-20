const { DataTypes } = require('sequelize')
const db = require('../helpers/db')
const TransaksiDetail = require('./TransaksiDetail')
const User = require('./User')

const Transaksi = db.define('transaksi', {
    idTransaksi: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    tanggalTransaksi: {
        type: DataTypes.DATE,
        allowNull: false
      },
    hargaKeseluruhan: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          notNull: true,
          notEmpty: true
        }
    },
    buktiPembayaran: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    statusTransaksi: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: true,
        notEmpty: true
      }
    },
    idUser: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
  }, {
    freezeTableName: true,
    timestamps:false
  }) 
  Transaksi.belongsTo(User,{foreignKey:'idUser'})
  Transaksi.hasMany(TransaksiDetail,{foreignKey : 'idTransaksi'})
  module.exports = Transaksi