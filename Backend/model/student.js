const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('student', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    image: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    phone: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    father_name: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    father_phone: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    email: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    address: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    bform: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    roll_no: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    center_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    batch_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    class_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    status: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'student',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
    ]
  });
};
