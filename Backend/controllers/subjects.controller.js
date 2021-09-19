const mydatabase = require('../util/database ');
var dateformat = require('dateformat');
function add(req , res){
 // var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
  var name = req.body.name;
  var category = req.body.category;
  var allowed_classes = req.body.allowed_classes;
  var sql = `insert into subjects(name, category, allowed_classes) 
  VALUES ("${name}", "${category}", "${allowed_classes}")`;
  mydatabase.query( sql , function(error , rows, fields){
      if(error) throw error
      res.send("Added class successfully !");
      res.end();

  })
}


function addnewAasignedSubject(req , res){
  // var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
   var teacher_name = req.body.teacher_name;
   var class_name = req.body.class_name;
   var subject_name = req.body.subject_name;
   var isHomeworkAvailFlag = req.body.isHomeworkAvailFlag;
   var zoom_link = req.body.zoom_link;
   var sql = `insert into student_teacher_class(teacher_name, class_name ,subject_name, isHomeworkAvailFlag, zoom_link) 
   VALUES ("${teacher_name}", "${class_name}","${subject_name}", "${isHomeworkAvailFlag}", "${zoom_link}")`;
   mydatabase.query( sql , function(error , rows, fields){
       if(error) throw error
       res.send("Added successfully !");
       res.end();
 
   })
 }

function addsubcatogory(req , res){
    var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
    var name = req.body.name;

    var sql = `insert into subject_categories(name) 
    VALUES ("${name}")`;
    mydatabase.query( sql , function(error , rows, fields){
        if(error) throw error
        res.send("added successfully !");
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
console.log("hi")
var quer ='SELECT name,category ,allowed_classes FROM subjects'   ;
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


function viewsubectAllsubjects(req , res){
var quer ='SELECT name,category,allowed_classes FROM subjects '   ;
mydatabase.query( quer  , function (error, results, fields) {
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
  


function teacherseeshersubjects(req , res){
  var username = req.userData.name;

   
  var quer ='SELECT teacher_name,class_name,subject_name,isHomeworkAvailFlag,zoom_link FROM student_teacher_class WHERE teacher_name = ?'   ;
  mydatabase.query( quer  ,[username] , function (error, results, fields) {
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
  

  function sudentseeshersubjects(req , res){
    var username = req.userData.email;
  
     
    var quer ='SELECT className,studentEmail FROM clasAtdent WHERE studentEmail = ?'   ;
    mydatabase.query( quer  ,[username] , function (error, results, fields) {
    if (error) {
        res.json({
          status:false,
          message:'there are some error with query'
          })
    }else{
                console.log(results[0]);
         
                console.log(results[0].className);
                var class_name = results[0].className.split("-") ;
                console.log(class_name) ; 
                console.log(class_name[0]) ; 
                var quer ='SELECT teacher_name,class_name,subject_name,isHomeworkAvailFlag,zoom_link FROM student_teacher_class WHERE class_name = ?'   ;
                mydatabase.query( quer  ,[results[0].className] , function (error, results, fields) {
                if (error) {
                    res.json({
                      status:false,
                      message:'there are some error with query'
                      })
                }else{
                console.log("hii");
                res.end(JSON.stringify(results));
                
                }
                });
              
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
  sudentseeshersubjects:sudentseeshersubjects ,
    register: add,
    addsubcatogory:addsubcatogory ,
    viewsubcategory:viewsubcategory ,
    viewsubs:viewsubs ,
    viewsubectAllsubjects:viewsubectAllsubjects ,
    deleteann : deleteann ,
    addnewAasignedSubject:addnewAasignedSubject,
    teacherseeshersubjects :teacherseeshersubjects
} 