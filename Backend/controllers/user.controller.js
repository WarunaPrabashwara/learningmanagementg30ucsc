const mydatabase = require('../util/database ');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
mydatabase.connect();

function register(req , res){
  var email = req.body.email;
  var userLevel = req.body.userLevel;
  var name = req.body.name;
  mydatabase.query('SELECT * FROM users WHERE email = ?',[email], function (error, results, fields) {
    if (error) {
        res.json({
          status:false,
          message:'There are some error with query'
          }) 
          res.end();
    }else{
     
      if(results.length >0){
        res.json({
          status:false,
          message:'Email already exists',
         
      })
      res.end();
      }
      else{
        bcryptjs.genSalt(2, function(err, salt){
          bcryptjs.hash(req.body.password, salt, function(err, hash){
      
            var password = hash;
      
            var sql = `insert into users(name, password, email ,userLevel) VALUES ("${name}", "${password}", "${email}", "${userLevel}")`;
            mydatabase.query( sql , function(error , rows, fields){
                if(error) throw error
                res.send("Registration Successfull !");
                res.end();
        
            })
      
          });
      });
          
      }
    }
  });

}

function login(req , res){
 
    var email=req.body.email;
    var password=req.body.password;
    
   
    mydatabase.query('SELECT * FROM users WHERE email = ?',[email], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'There are some error with query'
            })
      }else{
       
        if(results.length >0){

          bcryptjs.compare(password, results[0].password, function(err, result){
            if(result){
                const token = jwt.sign({
                    email: results[0].email,
                    userLevel:  results[0].userLevel,
                    id :results[0].id
                    //name :results[0].name,
                }, '3000',{expiresIn:'20h'}, function(err, token){
                    res.status(200).json({
                      status:true,
                      message:'Successfully Authenticated',
                      userLevel: results[0].userLevel ,
                        token: token
                    });
                });
            }else{
                res.status(401).json({
                    message: "Invalid Credentials!",
                });
            }
        });
  

          
        }
        else{
          res.json({
              status:false,    
              message:"Email does not exits"
          });
        }
      }
    });
  }

function changepswd(req , res){
 
    var email=req.userData.email;
    var oldpassword=req.body.oldpassword;
    var newpassword=req.body.newpassword;
   
    mydatabase.query('SELECT * FROM users WHERE email = ?',[email], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'There are some error with query'
            })
      }else{
        if(results.length >0){
          bcryptjs.compare(oldpassword, results[0].password, function(err, result){
            if(result){

              bcryptjs.genSalt(2, function(err, salt){
                bcryptjs.hash(newpassword, salt, function(err, hash){
            
                  var changepassword = hash;
            
                  mydatabase.query('UPDATE users SET password = ? WHERE email = ?',[changepassword , email], function (error, results, fields) {
                    if (error) {
                        res.json({
                          status:false,
                          message:'There are some error with query'
                          })
                    }else{
                      res.status(200).json({
                        status:true,
                        message:'Successfully changed password',

                      });
                    }
                    });
            
                });
            });



            }else{
                res.status(401).json({
                    message: "Invalid credentials!",
                });
            }
        });
        }
        else{
          res.json({
              status:false,    
              message:"Email does not exits"
          });
        }
      }
    });
  }

function myProfileData(req , res){
 
    var email=req.userData.email;

    
   
    mydatabase.query('SELECT * FROM users WHERE email = ?',[email], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'There are some error with query'
            })
      }else{
        res.status(200).json({
    
          email:results[0].email,
          indexNo: results[0].indexNo ,
  
        });

      }
    });
  }
  
module.exports = {
    myProfileData :myProfileData,
    register: register,
    login: login,
    changepswd :changepswd ,
} 