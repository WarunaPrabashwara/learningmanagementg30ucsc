const express = require("express");
const app = express();
const cors = require("cors");
app.use(express.json())
app.use(cors())

//  MySQL Connection
const mysql = require("mysql");
const mydatabase = mysql.createConnection({
  host :    'localhost',
  user:     'root',
  password : 'root',
  database :  'dbinterim'
});
mydatabase.connect(); 

//  post Method
app.post("/register", function(req , res){
    var name = req.body.uname;
    var password = req.body.password;
    var email = req.body.email;
    var userLevel = req.body.userLevel;
    var sql = `insert into users(name, password, email ,userLevel) VALUES ("${name}", "${password}", "${email}", "${userLevel}")`;
    mydatabase.query( sql , function(error , rows, fields){
        if(error) throw error
        res.send("Registration Successfull !");
        res.end();
    })
});


app.get("/userlist", function(req,res){
    var id = req.body.id;
    mydatabase.query('select * from users order by id desc' , function(error, rows, fields){
        if(error) throw error
        res.send(JSON.stringify(rows));
        res.end();
    })
})

app.listen(2222, function(){
    console.log("Server is Running on port 2222")
})