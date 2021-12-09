const { DataTypes } = require('sequelize')

const db = require('../helpers/db')

const Kategori = db.define('kategori', {
  idKategori: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  namaKategori: {
    type: DataTypes.STRING,
    allowNull: false
  },
  }, {
    freezeTableName: true,
    timestamps:false
  })

  module.exports = Kategori