const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('class_', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    center_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    total_students: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    subjects_id: {
      type: DataTypes.STRING(11),
      allowNull: true
    },
    status: {
      type: DataTypes.STRING(50),
      allowNull: true,
      defaultValue: "1"
    }
  }, {
    sequelize,
    tableName: 'class',
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
