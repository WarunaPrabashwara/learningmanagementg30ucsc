const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { promisify } = require('util');
const unlinkAsync = promisify(fs.unlink);

var email = "";
const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, './uploads/timetables');
        console.log(req.body.emailofStudentorTeacher);
    },
    filename: function(req, file, cb){
        email = req.body.emailofStudentorTeacher ;
        console.log(req.body.emailofStudentorTeacher);
        console.log(req.headers.emailofStudentorTeacher);
        console.log(req.params.emailofStudentorTeacher);
        console.log(email);
      //     cb(null, new Date().getTime() + path.extname(file.originalname));
      // file.originalname.split('.')[0] 
        console.log(file.fieldname);
      //  console.log(uuid.v4());
        console.log(path.extname(file.originalname));
        console.log(file.originalname);
      //  console.log(fileObj[file.emailofStudentorTeacher]);
      //  console.log(fileObj[file.mimetype]);
      cb(null,  file.originalname.split(".")[0] + '.png');
        //teacherge name ekt hdpn file ek
    }
});

const fileFilter = (req, file, cb) => {
    if(file.mimetype === 'image/jpeg' || file.mimetype === 'image/png'){
        cb(null, true);
    }else{
        cb(new Error('Unsupported files'), false);
    }
}

const upload = multer({
    storage: storage,
    limits: {
        fileSize:1024*1024*10
    },
    fileFilter:fileFilter
});
/*
DiskStorage.prototype._removeFile = function _removeFile (req, file, cb) {
    var path = file.path
  
    delete file.destination
    delete file.filename
    delete file.path
  
    fs.unlink(path, cb)
  }
  MemoryStorage.prototype._removeFile = function _removeFile (req, file, cb) {
    delete file.buffer
    cb(null)
  }
*/
module.exports = {
    upload: upload
}