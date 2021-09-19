//myProfileData,register,viewusers ,login,changepswd ,viewTeachers ,viewStudents 

const mydatabase = require('../util/database ');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
mydatabase.connect();

function register(req , res){
  var email = req.body.email;
  var userLevel = req.body.userLevel;
  var name = req.body.name;
  var indexNo  = req.body.indexNo ;
  var telephone  = req.body.telephone ;
  var address  = req.body.address ;
  var dob  = req.body.dob ;
  mydatabase.query('SELECT * FROM users WHERE email = ?',[email], function (error, results, fields) {
    if (error) {
        res.json({
      
          message:'there are some error with query'
          }) 
          res.end();
    }else{
     
      if(results.length >0){
        res.json({
      
          message:'email already exists',
         
      })
      res.end();
      }
      else{
        bcryptjs.genSalt(2, function(err, salt){
          bcryptjs.hash(req.body.password, salt, function(err, hash){
      
            var password = hash;
      
            var sql = `insert into users(name, password, email ,userLevel , indexNo , telephone , address , dob ) VALUES ("${name}", "${password}", "${email}", "${userLevel}" , "${indexNo}", "${telephone}", "${address}", "${dob}")`;
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

function viewusers(req , res){
  console.log("fdfsaaagfvvx") ;

  var quer ='SELECT id,name,email,userLevel,indexNo,telephone,address,dob FROM users' ;
  mydatabase.query( quer , function (error, results, fields) {
  if (error) {
      res.json({
        status:false,
        message:'there are some error with query'
        })
  }else{
  
  res.end(JSON.stringify(results));

  }
  });

  }


function viewTeachers(req , res){
    console.log("fdfsaaagfvvx") ;
  
    var quer ='SELECT id,name,email,userLevel,indexNo,telephone,address,dob FROM users WHERE userLevel = ?' ;
    mydatabase.query( quer ,['teacher'], function (error, results, fields) {
    if (error) {
        res.json({
          status:false,
          message:'there are some error with query'
          })
    }else{
    
    res.end(JSON.stringify(results));
  
    }
    });
  
   
  }
  
function viewStudents(req , res){
      console.log("fdfsaaagfvvx") ;
    
      var quer ='SELECT id,name,email,userLevel,indexNo,telephone,address,dob FROM users WHERE userLevel = ?' ;
      mydatabase.query( quer ,['student'], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'there are some error with query'
            })
      }else{
      
      res.end(JSON.stringify(results));
    
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
            message:'there are some error with query'
            })
      }else{
       
        if(results.length >0){

          bcryptjs.compare(password, results[0].password, function(err, result){
            if(result){
                const token = jwt.sign({
                    email: results[0].email,
                    userLevel:  results[0].userLevel,
                    id :results[0].id,
                    name : results[0].name ,
                    //name :results[0].name,
                }, '3000',{expiresIn:'20h'}, function(err, token){
                    res.status(200).json({
                      status:true,
                      message:'successfully authenticated',
                      userLevel: results[0].userLevel ,
                      token: token
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

function changepswd(req , res){
 
    var email=req.userData.email;
    var oldpassword=req.body.oldpassword;
    var newpassword=req.body.newpassword;
   
    mydatabase.query('SELECT * FROM users WHERE email = ?',[email], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'there are some error with query'
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
                          message:'there are some error with query'
                          })
                    }else{
                      res.status(200).json({
                        status:true,
                        message:'successfully changed password',

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
            message:'there are some error with query'
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
    viewusers:viewusers ,
    login: login,
    changepswd :changepswd ,
    viewTeachers : viewTeachers ,
    viewStudents : viewStudents 

} 