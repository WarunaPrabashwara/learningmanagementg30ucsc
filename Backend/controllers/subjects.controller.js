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


function studentcheckifHomeworkAvailable(req , res){
  var teacher_name = req.query.teacher_name ;
  var class_name = req.query.class_name ;
  var subject_name = req.query.subject_name ;

var quer ='SELECT teacher_name,class_name,subject_name,isHomeworkAvailFlag,zoom_link FROM student_teacher_class WHERE teacher_name = ? and class_name = ? and subject_name =?'   ;
mydatabase.query( quer  ,[teacher_name, class_name , subject_name ] , function (error, results, fields) {
if (error) {
  res.json({
    status:false,
    message:'there are some error with query'
    })
}else{
//console.log(results[0].isHomeworkAvailFlag);
res.end(JSON.stringify(results));

}
});
  
  }

function teacheraddhomework(req , res){
  var teacher_name = req.body.teacher_name ;
  var class_name = req.body.class_name ;
  var subject_name = req.body.subject_name ;

var quer ='update student_teacher_class set isHomeworkAvailFlag = 1  WHERE teacher_name = ? and class_name = ? and subject_name =?'   ;
mydatabase.query( quer  ,[teacher_name, class_name , subject_name ] , function (error, results, fields) {
if (error) {
  res.json({
    status:false,
    message:'there are some error with query'
    })
}else{
//console.log(results[0].isHomeworkAvailFlag);
res.end(JSON.stringify(results));

}
});
 }

 function teacherDeleteHomework(req , res){
  var teacher_name = req.body.teacher_name ;
  var class_name = req.body.class_name ;
  var subject_name = req.body.subject_name ;

var quer ='update student_teacher_class set isHomeworkAvailFlag = 0  WHERE teacher_name = ? and class_name = ? and subject_name =?'   ;
mydatabase.query( quer  ,[teacher_name, class_name , subject_name ] , function (error, results, fields) {
if (error) {
  res.json({
    status:false,
    message:'there are some error with query'
    })
}else{
//console.log(results[0].isHomeworkAvailFlag);
    var quer ='delete from homeworkreports  WHERE teacher_name = ? and class_name = ? and subject_name =?'   ;
    mydatabase.query( quer  ,[teacher_name, class_name , subject_name ] , function (error, results, fields) {
      if (error) {
        res.json({
          status:false,
          message:'there are some error with query'
          })
      }else{
      //console.log(results[0].isHomeworkAvailFlag);
      
      res.end(JSON.stringify(results));
      
      }
      });

}
});

}


 function studentaddresponse(req , res){
  // var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
   var teacher_name = req.body.teacher_name;
   var class_name = req.body.class_name;
   var subject_name = req.body.subject_name;
   // var isHomeworkAvailFlag = req.body.isHomeworkAvailFlag;
 var studentUserName =req.userData.email;
var  title  ="" ;
var submission_text = req.body.submission_text ;
var submission_location = ""
var marks = null ;

   var sql = `insert into homeworkreports(teacher_name,class_name,subject_name,studentUserName,title,submission_text,submission_location ,mark) 
   VALUES ("${teacher_name}", "${class_name}", "${subject_name}" , "${studentUserName}", "${title}","${submission_text}", "${submission_location}", "${marks}")`;
   mydatabase.query( sql , function(error , rows, fields){
       if(error) throw error
       res.send("Added Homewrk response successfully !");
       res.end();
 
   })

 }

 
 function teacherviewHomeworkofstudents(req , res){
  // var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
   var teacher_name = req.query.teacher_name;
   var class_name = req.query.class_name;
   var subject_name = req.query.subject_name;
   // var isHomeworkAvailFlag = req.body.isHomeworkAvailFlag;

   var sql = `select * from homeworkreports where teacher_name = ? and class_name = ? and subject_name = ?` ;
   mydatabase.query( sql , [teacher_name ,class_name,subject_name ], function(error , results, fields){
       if(error) throw error
       res.end(JSON.stringify(results));
 
   })

 }



 function teacheraddmark(req , res){
  // var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
   var teacher_name = req.body.teacher_name;
   var class_name = req.body.class_name;
   var subject_name = req.body.subject_name;
   // var isHomeworkAvailFlag = req.body.isHomeworkAvailFlag;
   var studentUserName = req.body.studentUserName;
  var mark = req.body.mark ;
  console.log(teacher_name);
  console.log(class_name);
  console.log(subject_name);
  console.log(studentUserName);
  console.log(mark);
   var sql = `update homeworkreports set mark = ?  where teacher_name = ?  and class_name = ? and  subject_name = ? and studentUserName = ? `;
   mydatabase.query( sql , [mark ,teacher_name , class_name , subject_name , studentUserName], function(error , rows, fields){
       if(error) throw error
       res.send("updated successfully !");
       res.end();
 
   })
 }
 function studentpagehasIFhomeworkwassubmittedornot(req , res){
  var teacher_name = req.query.teacher_name;
  var class_name = req.query.class_name;
  var subject_name = req.query.subject_name;

  var quer = 'SELECT teacher_name,class_name,subject_name,studentUserName,title,submission_text,submission_location ,mark  FROM homeworkreports WHERE teacher_name =  ? and class_name = ?  and  subject_name = ?'   ;
  mydatabase.query( quer  ,[teacher_name , class_name ,subject_name] , function (error, results, fields) {
  if (error) {
      res.json({
        status:false,
        message:'there are some error with query'
        })
  }else{
   
    console.log(results);
  res.end(JSON.stringify(results));
  
  }
  });
  
  }

 function studentviewMArks(req , res){
  var username = req.userData.email;

   
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

 
function addzoomlink(req , res){
  // var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
   var teacher_name = req.body.teacher_name;
   var class_name = req.body.class_name;
   var subject_name = req.body.subject_name;
   // var isHomeworkAvailFlag = req.body.isHomeworkAvailFlag;
   var zoom_link = req.body.zoom_link;
   var sql = `update student_teacher_class set zoom_link = '${zoom_link}' where  teacher_name = '${teacher_name}' and class_name ='${class_name}' and  subject_name = '${subject_name}' `;
   mydatabase.query( sql , function(error , rows, fields){
       if(error) throw error
       res.send("updated successfully !");
       res.end();
 
   })
 }
 
 function teacherseeshersubjects(req , res){
  var username = req.userData.email;

   
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

  function studentseezoomlink(req , res){
        var teacher_name = req.query.teacher_name ;
        var class_name = req.query.class_name ;
        var subject_name = req.query.subject_name ;
     
    var quer ='SELECT teacher_name,class_name,subject_name,isHomeworkAvailFlag,zoom_link FROM student_teacher_class WHERE teacher_name = ? and class_name = ? and subject_name =?'   ;
    mydatabase.query( quer  ,[teacher_name, class_name , subject_name ] , function (error, results, fields) {
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
  
  function addsubjectmaterial(req , res){
    // var date_time = dateformat(new Date() , "yyyy-mm-dd h:MM:ss") ;
     var teacher_name = req.body.teacher_name;
     var class_name = req.body.class_name;
     var subject_name = req.body.subject_name;
     // var isHomeworkAvailFlag = req.body.isHomeworkAvailFlag;
     var material = req.body.material;
     var sql = `insert into subjectmaterial2(teacher_name, class_name, subject_name ,material ) 
     VALUES ("${teacher_name}", "${class_name}", "${subject_name}" , "${material}")`;
          mydatabase.query( sql , function(error , rows, fields){
         if(error) throw error
         res.send("updated successfully !");
         res.end();
   
     })
   }
  
   function viewsubjectmaterial(req , res){
    var username = req.userData.email;
  
     
    var quer ='SELECT teacher_name,class_name,subject_name,material FROM subjectmaterial2 WHERE teacher_name = ?'   ;
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
    function viewsubjectmaterialstudent(req , res){
  //    var username = req.userData.email;
    var class_name = req.query.class_name ;
    var class_name = req.query.class_name ;
    var class_name = req.query.class_name ;
       console.log(class_name) ;
      var quer ='SELECT teacher_name,class_name,subject_name,material FROM subjectmaterial2 WHERE class_name = ?'   ;
      mydatabase.query( quer  ,[class_name] , function (error, results, fields) {
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



function view_student_teacher_class(req , res){
  var userLevel = req.userData.userLevel;
  var filter = "";
console.log("hi")
var quer ='SELECT  teacher_name , class_name,subject_name,isHomeworkAvailFlag,zoom_link  FROM student_teacher_class'   ;
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
  

function teacherseesubjectmaterial(req , res){
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
  teacheraddmark:teacheraddmark,
  teacherviewHomeworkofstudents:teacherviewHomeworkofstudents,
  studentaddresponse:studentaddresponse,
  studentpagehasIFhomeworkwassubmittedornot : studentpagehasIFhomeworkwassubmittedornot,
  viewsubjectmaterialstudent:viewsubjectmaterialstudent,
  addsubjectmaterial:addsubjectmaterial,
  viewsubjectmaterial:viewsubjectmaterial,
  teacherseesubjectmaterial:teacherseesubjectmaterial, 
  addzoomlink :addzoomlink ,
  view_student_teacher_class : view_student_teacher_class ,
  sudentseeshersubjects:sudentseeshersubjects ,
    register: add,
    addsubcatogory:addsubcatogory ,
    viewsubcategory:viewsubcategory ,
    viewsubs:viewsubs ,
    viewsubectAllsubjects:viewsubectAllsubjects ,
    deleteann : deleteann ,
    addnewAasignedSubject:addnewAasignedSubject,
    teacherseeshersubjects :teacherseeshersubjects,
    studentseezoomlink:studentseezoomlink ,
    studentcheckifHomeworkAvailable :studentcheckifHomeworkAvailable,
    teacheraddhomework:teacheraddhomework ,
    teacherDeleteHomework :teacherDeleteHomework
} 