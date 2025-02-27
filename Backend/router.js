const controller = require("./controller")

const router = require("express").Router()

router.post("/MarkAttendance",controller.MarkAttendance)

router.post("/AdminMarkAttendance",controller.AdminMarkAttendance)

router.post("/login",controller.login)

router.post("/getStudent",controller.getStudent)

router.post("/getClass",controller.getClass)

router.post("/getAdminClass",controller.getAdminClass)

router.post("/getSubject",controller.getSubject)

router.post("/getAttendanceDate",controller.getAttendanceDate)

module.exports = router