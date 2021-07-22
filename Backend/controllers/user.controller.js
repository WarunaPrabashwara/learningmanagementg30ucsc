const mydatabase = require('../util/database ');
mydatabase.connect();

function register(req , res){
    
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
  }

  
module.exports = {
    register: register,
    login: login
} 