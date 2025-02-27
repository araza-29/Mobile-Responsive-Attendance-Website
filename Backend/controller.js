const db = require("./Model")
const {Op} = require("sequelize")
let attendances = db.attendance
let user = db.user
let classe = db.class
let teacher = db.teacher
let subject = db.subject
let student = db.student
const MarkAttendance = async (req,res) => {
    let info = {
        student_id: req.body.student_id,
        center_id: req.body.center_id,
        class_id: req.body.class_id,
        user_id: req.body.user_id,
        subject_id: req.body.subject_id,
        status: req.body.status
    }
    const attendance = await attendances.create(info)
    res.status(200).send(attendance)
}
const AdminMarkAttendance = async (req,res) => {
    let info = {
        student_id: req.body.student_id,
        center_id: req.body.center_id,
        class_id: req.body.class_id,
        admin_id: req.body.admin_id,
        subject_id: req.body.subject_id,
        status: req.body.status
    }
    const attendance = await attendances.create(info)
    res.status(200).send(attendance)
}



const login = async (req,res) => {


    let body = req.body
    let email = body.email
    let password = body.password
    let role = body.roleId
    console.log(role)
    console.log(email)
    console.log(password)
    const users = await user.findOne({where: {email: email, role_id:{[Op.like]: "%"+role+"%"}}})
    if(users == null) {
        return res.json({code:500,status:false,message:"data not found",data:[]})
    }
    else if(users.password!=password && users.email!=email) {
        return res.json({code:100,status:false,message:"data not found",data:[]})
    }
    else if(users.password!=password){
        return res.json({code:300,status:false,message:"data not found",data:[]})
    }
    else if(users.email!=email) {
        return res.json({code:400,status:false,message:"data not found",data:[]})
    }
    else{
        return res.json({code:200,status:true,message:"data found",data: users})
    }

} 

const getClass = async (req,res) => {

    let id = req.body.user_id

    let classes = await teacher.findAll({ include:[{model:classe, required:true, attributes:['name']}],attributes: ['class_id'], where: {user_id: id},raw: true})
    const renamedResult = classes.map(item => {
        return {
          id: item.class_id,
          name: item['class_.name']
        };
      });

    if(renamedResult){
        return res.json({code:200,status:true,message:"data found",data: renamedResult})
    
    }else{

        return res.json({code:400,status:false,message:"data not found",data:[]})
    
    }
}
const getAdminClass = async (req,res) => {

    let center = req.body.center_id

    let classes = await classe.findAll({attributes: ['id','name'], where: {center_id:center},raw: true})
    const renamedResult = classes.map(item => {
        return {
          id: item.id,
          name: item.name
        };
      });

    if(renamedResult){
        return res.json({code:200,status:true,message:"data found",data: renamedResult})
    
    }else{

        return res.json({code:400,status:false,message:"data not found",data:[]})
    
    }
}
const getSubject = async(req,res) => {
    let class_id = req.body.class_id
    let user_id = req.body.user_id

    const subjects = await teacher.findAll({include:[{model:subject, required:true, attributes:['name']}], attributes: ['subject_id'], where: {user_id: user_id, class_id: class_id},raw:true})
    const result = subjects.map(item=>{
        return {
            name:item["subject.name"],
            id: item["subject_id"]
        };
    });

    if(result){
        return res.json({code:200,status:true,message:"data found",data: result})
    
    }else{

        return res.json({code:400,status:false,message:"data not found",data:[]})
    
    }

}


const getStudent = async (req,res) => 
{
    let id = req.body.class_id
    let center = req.body.center_id

    let studentsInstances = await student.findAll({attributes: ['id','name','roll_no','status'], where: {class_id:id, center_id: center, status:1}})
    let students = studentsInstances.map(student => student.dataValues);

    students = students.map(student => {
        student.roll = student.roll_no;
        student.status =  student.status === 1 ? "active" : "banned";
        delete student.roll_no; // Optionally, you can delete the old key if needed
        return student;
    });

    if (students && students.length > 0) {
        return res.json({ code: 200, status: true, message: "Data found", data: students });
    } else {
        return res.json({ code: 400, status: false, message: "Data not found", data: [] });
    }
}

const getAttendanceDate = async (req,res) => {
    let adminId = req.body.admin_id
    let userId = req.body.user_id
    let subject = req.body.subject_id
    let classes = req.body.class_id
    let role = req.body.role
    let center = req.body.center_id
    
    var date = new Date();
    var year = date.toLocaleString("default", { year: "numeric" });
    var month = date.toLocaleString("default", { month: "2-digit" });
    var day = date.toLocaleString("default", { day: "2-digit" });
    var date = year + "-" + month + "-" + day;
    console.log(date);  // Prints: 2022-05-04
    if(role === "Admin"){
        let exists = await attendances.findOne({where: {center_id:center, class_id:classes, subject_id: null, createdAt:{ [Op.between]: [date + ' 00:00:00', date + ' 23:59:59'] }}})
        if(exists)
            return res.json({ code: 200, status: true, message: "data", data: exists})
        else
             return res.json({ code: 300, status: false, message: "data not found", data: []})
    }
    else if(role === "Teacher") {
        let exists = await attendances.findOne({where: {center_id:center, class_id:classes, subject_id: subject, createdAt:{ [Op.between]: [date + '00:00:00', date + ' 23:59:59'] }}})
        if(exists)
            return res.json({ code: 200, status: true, message: "data", data: exists})
        else
             return res.json({ code: 300, status: false, message: "data not found", data: []})
    }
    else {
        return res.json({ code: 400, status: false, message: "Invalid user", data: []})
    }
}

module.exports = {
    login,
    MarkAttendance,
    AdminMarkAttendance,
    getStudent,
    getSubject,
    getClass,
    getAdminClass,
    getAttendanceDate
}