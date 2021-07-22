const express = require("express");
const app = express();
const cors = require("cors");
app.use(express.json())
app.use(cors())
const jwt = require('jsonwebtoken');
const userRoute = require('./routes/user');
//  MySQL Connection

 
app.use("/user", userRoute);
//  post Method


app.listen(2222, function(){
    console.log("Server is Running on port 2222")
})