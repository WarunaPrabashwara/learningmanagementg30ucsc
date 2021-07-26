const express = require("express");
const app = express();
const cors = require("cors");
app.use(express.json())
app.use(cors())
const jwt = require('jsonwebtoken');
const userRoute = require('./routes/user');
const timetableRoute = require('./routes/timetable');
const announcementRoute = require('./routes/announcement ');
const checkAuthMiddleware = require('./middleware/check-auth');
//  MySQL Connection
app.use(express.json());
app.use('/uploads', checkAuthMiddleware.checkAuth, express.static('uploads'));
 
app.use("/user", userRoute);
app.use("/timetable", timetableRoute);
app.use("/announcement", announcementRoute);

//  post Method


app.listen(2222, function(){
    console.log("Server is Running on port 2222")
})