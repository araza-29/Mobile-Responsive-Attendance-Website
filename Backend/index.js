const express = require("express")
const app = express()
const router = require("./router")
const cors = require('cors')

app.use(cors()); 

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
  });
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use("/Attendance",router)
 


app.listen(3001,()=> {
    console.log("Server is running")
})