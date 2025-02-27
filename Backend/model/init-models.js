var DataTypes = require("sequelize").DataTypes;
var _account = require("./account");
var _attendances = require("./attendances");
var _bank = require("./bank");
var _batch = require("./batch");
var _cchapter = require("./cchapter");
var _center = require("./center");
var _class_ = require("./class");
var _ctopic = require("./ctopic");
var _duty = require("./duty");
var _examination = require("./examination");
var _notification_status = require("./notification_status");
var _result = require("./result");
var _rscreen = require("./rscreen");
var _srecord = require("./srecord");
var _student = require("./student");
var _subject = require("./subject");
var _teacher = require("./teacher");
var _u_role = require("./u_role");
var _user = require("./user");

function initModels(sequelize) {
  var account = _account(sequelize, DataTypes);
  var attendances = _attendances(sequelize, DataTypes);
  var bank = _bank(sequelize, DataTypes);
  var batch = _batch(sequelize, DataTypes);
  var cchapter = _cchapter(sequelize, DataTypes);
  var center = _center(sequelize, DataTypes);
  var class_ = _class_(sequelize, DataTypes);
  var ctopic = _ctopic(sequelize, DataTypes);
  var duty = _duty(sequelize, DataTypes);
  var examination = _examination(sequelize, DataTypes);
  var notification_status = _notification_status(sequelize, DataTypes);
  var result = _result(sequelize, DataTypes);
  var rscreen = _rscreen(sequelize, DataTypes);
  var srecord = _srecord(sequelize, DataTypes);
  var student = _student(sequelize, DataTypes);
  var subject = _subject(sequelize, DataTypes);
  var teacher = _teacher(sequelize, DataTypes);
  var u_role = _u_role(sequelize, DataTypes);
  var user = _user(sequelize, DataTypes);

  attendances.belongsTo(center, { as: "center", foreignKey: "center_id"});
  center.hasMany(attendances, { as: "attendances", foreignKey: "center_id"});
  attendances.belongsTo(class, { as: "class", foreignKey: "class_id"});
  class.hasMany(attendances, { as: "attendances", foreignKey: "class_id"});
  attendances.belongsTo(student, { as: "student", foreignKey: "student_id"});
  student.hasMany(attendances, { as: "attendances", foreignKey: "student_id"});
  attendances.belongsTo(subject, { as: "subject", foreignKey: "subject_id"});
  subject.hasMany(attendances, { as: "attendances", foreignKey: "subject_id"});
  attendances.belongsTo(user, { as: "user", foreignKey: "user_id"});
  user.hasMany(attendances, { as: "attendances", foreignKey: "user_id"});

  return {
    account,
    attendances,
    bank,
    batch,
    cchapter,
    center,
    class_,
    ctopic,
    duty,
    examination,
    notification_status,
    result,
    rscreen,
    srecord,
    student,
    subject,
    teacher,
    u_role,
    user,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
