const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('examination', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    center_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    subject_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    type: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    month: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    date: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    total_marks: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    invigilator: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    schedule_start_time: {
      type: DataTypes.STRING(225),
      allowNull: true
    },
    schedule_end_time: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    start_time: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    end_time: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    checking_status: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    status: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'examination',
    timestamps: true,
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
