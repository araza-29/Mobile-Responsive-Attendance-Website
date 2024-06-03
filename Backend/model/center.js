const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('center', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    logo: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    status: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: 1
    },
    address: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    phone_no: {
      type: DataTypes.STRING(255),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'center',
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
