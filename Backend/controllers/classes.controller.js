const mydatabase = require('../util/database ');
var dateformat = require('dateformat');
function add(req , res){

  var section = req.body.section;
  var grade = req.body.grade;
 
  var sql = `insert into classes(section, grade) 
  VALUES ("${section}", "${grade}")`;
  mydatabase.query( sql , function(error , rows, fields){
      if(error) throw error
      res.send("Added class successfully !");
      res.end();

  })
}

function addtoclassStudentsGroup(req , res){
  console.log(req.body);
        //  JSON.parse(req.body , (key , value ) =>{
        //    console.log(key);
        //  });
  var className = req.body.className;
  var studentEmail = req.body.studentEmail;
 var stringg = studentEmail.split(" ");
 console.log(stringg ) ;
 for(  i in stringg ){
   console.log(stringg[i]) ;
   if(stringg[i] != ''){
    var sql = `insert into clasAtdent(className, studentEmail) 
    VALUES ("${className}", "${stringg[i]}")`;
    mydatabase.query( sql , function(error , rows, fields){
        if(error) throw error
    })
   }


 }
 res.send("Added Student successfully !");
   
 res.end();

}


function view(req , res){
      var userLevel = req.userData.userLevel;
      var filter = "";
 
var quer ='SELECT id,section,grade FROM classes' ;
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


function viewClassesandStudents(req , res){
  var userLevel = req.userData.userLevel;
  var filter = "";

var quer ='SELECT className, studentEmail FROM clasAtdent' ;
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

function viewMyAnnouncement(req , res){
  var userLevel = req.userData.userLevel;

 console.log(userLevel ) ;

var quer ='SELECT date_time,description FROM announcements where made_by = ? '   ;
mydatabase.query( quer , [userLevel] , function (error, results, fields) {
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
  

function deleteann(req , res){
  var announcementid = req.body.id;

console.log(announcementid);

var quer ='DELETE FROM announcements where description = ? '   ;
mydatabase.query( quer , [announcementid] , function (error, results, fields) {
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

module.exports = {
  addtoclassStudentsGroup:addtoclassStudentsGroup,
    register: add,
    view:view ,
    viewMyAnnouncement:viewMyAnnouncement ,
    deleteann : deleteann ,
    viewClassesandStudents :viewClassesandStudents  
} 