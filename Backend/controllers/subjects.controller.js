const mydatabase = require('../util/database ');
var dateformat = require('dateformat');
function add(req , res){
  var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
  var description = req.body.description;
  var made_by = req.userData.userLevel;
  var isAvailableForTeachersFlag = req.body.isAvailableForTeachersFlag;
  var isAvailableForStudentsFlag = req.body.isAvailableForStudentsFlag;
  var isAvailableForSectionheadsFlag = req.body.isAvailableForSectionheadsFlag;
  var isAvailableForAdminssFlag = req.body.isAvailableForAdminssFlag;
  var isAvailableForPrincipalsFlag = req.body.isAvailableForPrincipalsFlag;
  var sql = `insert into announcements(date_time, description, made_by ,isAvailableForTeachersFlag , isAvailableForStudentsFlag, isAvailableForSectionheadsFlag, isAvailableForAdminssFlag ,isAvailableForPrincipalsFlag) 
  VALUES ("${date_time}", "${description}", "${made_by}", "${isAvailableForTeachersFlag}","${isAvailableForStudentsFlag}", "${isAvailableForSectionheadsFlag}", "${isAvailableForAdminssFlag}", "${isAvailableForPrincipalsFlag}")`;
  mydatabase.query( sql , function(error , rows, fields){
      if(error) throw error
      res.send("published successfully !");
      res.end();

  })
}

function viewsubcategory(req , res){
      var userLevel = req.userData.userLevel;
      var filter = "";

var quer ='SELECT id,name FROM subject_categories'   ;
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

function viewsubs(req , res){
    var userLevel = req.userData.userLevel;
    var filter = "";

var quer ='SELECT id,name,category ,allowed_classes FROM subjects'   ;
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
    viewsubcategory:viewsubcategory ,
    viewsubs:viewsubs ,
    viewMyAnnouncement:viewMyAnnouncement ,
    deleteann : deleteann 
} 