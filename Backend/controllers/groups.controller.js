const mydatabase = require('../util/database ');
var dateformat = require('dateformat');
function add(req , res){

  var section = req.body.section;
  var grade = req.body.grade;
 
  var sql = `insert into groupsofstudents(class, groupname) 
  VALUES ("${section}", "${grade}")`;
  mydatabase.query( sql , function(error , rows, fields){
      if(error) throw error
      res.send("Added class successfully !");
      res.end();

  })
}



function view(req , res){
      var userLevel = req.userData.userLevel;
      var filter = "";
 
var quer ='SELECT class,groupname FROM groupsofstudents' ;
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
    
    register: add,
    view:view ,
    viewMyAnnouncement:viewMyAnnouncement ,
    deleteann : deleteann 
} 