const multer = require('multer');
const path = require('path');
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

module.exports = {
    upload: upload
}