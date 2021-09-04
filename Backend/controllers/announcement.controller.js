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


function view(req , res){
      var userLevel = req.userData.userLevel;
      var filter = "";
      if(userLevel == 'admin'){
        filter = "isAvailableForAdminssFlag"
      }
      else if(userLevel == 'section_head'){
        filter = "isAvailableForSectionheadsFlag"
      }
      else if(userLevel == 'principal'){
        filter = "isAvailableForPrincipalsFlag"
      }
      else if(userLevel == 'teacher'){
        filter = "isAvailableForTeachersFlag"
      }
      else if(userLevel == 'student'){
        filter = "isAvailableForStudentsFlag"
      }
var quer ='SELECT date_time,description,made_by FROM announcements where ' + filter + '= true'  ;
  mydatabase.query( quer , function (error, results, fields) {
    if (error) {
        res.json({
          status:false,
          message:'there are some error with query'
          })
    }else{
     
    //   console.log('a' + results[0].date_time);
    //   var userLevel = req.userData.userLevel;
    //   var filter = "";
    //   if(userLevel == 'admin'){
    //     filter = "isAvailableForAdminssFlag"
    //   }
    //   else if(userLevel == 'section_head'){
    //     filter = "isAvailableForSectionheadsFlag"
    //   }
    //   else if(userLevel == 'principal'){
    //     filter = "isAvailableForPrincipalsFlag"
    //   }
    //   else if(userLevel == 'teacher'){
    //     filter = "isAvailableForTeachersFlag"
    //   }
    //   else if(userLevel == 'student'){
    //     filter = "isAvailableForStudentsFlag"
    //   }
    //   var k = 0;
    //   var arr = [];
    // console.log('a' + filter);
    // console.log('a' + results[0].date_time);
    
    //   for(const Element of results){
    //      //    console.log('a' + results[Element].date_time);
    //     if(results[0].filter == 1){
    //       arr[k].date_time = results[Element].date_time ;
    //       arr[k].description = results[Element].description ;
    //       arr[k].made_by = results[Element].made_by ;
    //       k=k+1 ;
    //     }
    //   }

    //   res.end(JSON.stringify(arr));

    res.end(JSON.stringify(results));

    }
  });

}

  
module.exports = {
    
    register: add,
    view:view
} 