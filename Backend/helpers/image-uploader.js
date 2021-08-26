const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { promisify } = require('util');
const unlinkAsync = promisify(fs.unlink);

let email = "";
const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, './uploads/timetables');
    },
    filename: function(req, file, cb){
        email =req.body.email ;
        console.log(req.body.email);
        console.log(req.body);
      //     cb(null, new Date().getTime() + path.extname(file.originalname));
      // file.originalname.split('.')[0] 

      cb(null,  req.headers.emailofStudentorTeacher + '.png');
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