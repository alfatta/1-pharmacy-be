const { DataTypes } = require('sequelize')
const db = require('../helpers/db')
const Kategori = require('./Kategori')

const Obat = db.define('obat', {
    idObat: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    namaObat: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: true,
        notEmpty: true
      }
    },
    dosisObat: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          notNull: true,
          notEmpty: true
        }
    },
    infoObat: {
      type: DataTypes.TEXT,
      allowNull: false,
      validate: {
        notNull: true,
        notEmpty: true
      }
    },
    hargaObat: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notNull: true,
        notEmpty: true
      }
    },
    idKategori: {
      type: DataTypes.INTEGER,
      allowNull: false
      
    },

    gambarObat: {
      type: DataTypes.TEXT,
      allowNull: true
    },
  }, {
    freezeTableName: true,
    timestamps:true,
    paranoid:true
  }) 
  Obat.belongsTo(Kategori,{foreignKey:'idKategori'}) 
  module.exports = Obat