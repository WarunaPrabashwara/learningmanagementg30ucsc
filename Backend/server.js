const express = require("express");
const app = express();
const cors = require("cors");
app.use(express.json())
app.use(cors())
const jwt = require('jsonwebtoken');

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
    
    var name = req.body.name;
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


app.post("/login", function(req , res){
 
    var email=req.body.email;
    var password=req.body.password;
    
   
    mydatabase.query('SELECT * FROM users WHERE email = ?',[email], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'there are some error with query'
            })
      }else{
       
        if(results.length >0){
  //decryptedString = cryptr.decrypt(results[0].pssword);
            if(password==results[0].password){
                res.json({
                    status:true,
                    message:'successfully authenticated',
                    userLevel: results[0].userLevel ,
                })
            }else{
                res.json({
                  status:false,
                  message:"Email and password does not match"
                 });
            }
          
        }
        else{
          res.json({
              status:false,    
              message:"Email does not exits"
          });
        }
      }
    });
  });


app.listen(2222, function(){
    console.log("Server is Running on port 2222")
})