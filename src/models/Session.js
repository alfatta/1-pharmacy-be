const { DataTypes } = require('sequelize')

const db = require('../helpers/db')
const User = require('./User')

const Session = db.define('session', {
  idSession: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  tokenSession: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  idUser: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  }, {
    freezeTableName: true,
    timestamps:false
  })

module.exports = Session