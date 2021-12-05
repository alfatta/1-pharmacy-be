const { DataTypes } = require('sequelize')
const db = require('../helpers/db')

const User = db.define('user', {
    idUser: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    namaUser: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: true,
        notEmpty: true
      }
    },
    userName: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
          notNull: true,
          notEmpty: true
        }
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        isEmail: true,
        notNull: true,
        notEmpty: true
      }
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: true,
        notEmpty: true
      }
    },
    alamat: {
      type: DataTypes.STRING,
      allowNull: true
    },
    tanggalLahir: {
        type: DataTypes.STRING,
        allowNull: true
      },
    isAdmin: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    sudahAktif: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
    },
    token: {
      type: DataTypes.TEXT,
    }
  }, {
    freezeTableName: true,
    timestamps:false
  })  
  module.exports = User
