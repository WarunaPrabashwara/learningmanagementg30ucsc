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
    addsubcatogory:addsubcatogory ,
    viewsubcategory:viewsubcategory ,
    viewsubs:viewsubs ,
    viewsubectAllsubjects:viewsubectAllsubjects ,
    deleteann : deleteann 
} 