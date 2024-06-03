const config = require("./config")
const {Sequelize,DataTypes} = require("sequelize")

const sequelize = new Sequelize (
    config.DB,
    config.USER,
    config.PASSWORD, {
        host: config.HOST,
        dialect: config.dialect,
        timezone: '+05:00'
    },
)

sequelize.authenticate()
.then(()=>{
    console.log("connected")
})
.catch(err=> {
    console.log(err)
})

const db = {}

db.Sequelize = Sequelize
db.sequelize = sequelize
db.sequelize.sync({ alter: true })
.then(() => {
    console.log('yes re-sync done!')
})

db.student = require("./model/student")(sequelize,DataTypes)
db.attendance = require("./model/attendances")(sequelize,DataTypes)
db.subject = require("./model/subject")(sequelize,DataTypes)
db.teacher = require("./model/teacher")(sequelize,DataTypes)
db.class = require("./model/class")(sequelize,DataTypes)
db.center = require("./model/center")(sequelize,DataTypes)
db.user = require("./model/user")(sequelize,DataTypes)
db.student = require("./model/student")(sequelize,DataTypes)
db.userRole = require("./model/u_role")(sequelize,DataTypes)

db.student.hasMany(db.attendance,{
    foreignKey: 'student_id'
})
db.attendance.belongsTo(db.student, { foreignKey: 'student_id' })


db.user.hasMany(db.attendance,{
    foreignKey: 'user_id'
})
db.attendance.belongsTo(db.user, { foreignKey: 'user_id' })


db.subject.hasMany(db.attendance, {
    foreignKey: 'subject_id'
    
})
db.attendance.belongsTo(db.subject, { foreignKey: 'subject_id' })


db.class.hasMany(db.attendance,{
    foreignKey: 'class_id'
    
})
db.attendance.belongsTo(db.class, { foreignKey: 'class_id' })


db.center.hasMany(db.attendance,{
    foreignKey: 'center_id'
})
db.attendance.belongsTo(db.center, { foreignKey: 'center_id' })


db.subject.hasMany(db.teacher, {
    foreignKey: 'subject_id'
})
db.teacher.belongsTo(db.subject, { foreignKey: 'subject_id' })


db.class.hasMany(db.teacher, {
    foreignKey: 'class_id'
})
db.teacher.belongsTo(db.class, { foreignKey: 'class_id' })

db.user.hasMany(db.userRole, {
    foreignKey:"role_id"
})
db.userRole
module.exports = db