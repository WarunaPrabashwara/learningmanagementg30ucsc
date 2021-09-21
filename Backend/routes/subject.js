const express = require('express');
const announcementController = require('../controllers/subjects.controller');

const checkAuthMiddleware = require('../middleware/check-auth');
const router = express.Router();

router.post('/upload',checkAuthMiddleware.checkAuth, announcementController.register);
router.post('/addsubcatogory',checkAuthMiddleware.checkAuth, announcementController.addsubcatogory);
router.post('/addnewAasignedSubject',checkAuthMiddleware.checkAuth, announcementController.addnewAasignedSubject);

router.post('/studentaddresponse',checkAuthMiddleware.checkAuth, announcementController.studentaddresponse);

router.post('/addzoomlink',checkAuthMiddleware.checkAuth, announcementController.addzoomlink);
router.post('/addsubjectmaterial',checkAuthMiddleware.checkAuth, announcementController.addsubjectmaterial);
router.post('/teacheraddmark',checkAuthMiddleware.checkAuth, announcementController.teacheraddmark);


//router.delete('/delete', userController.delete);
//router.put('/update', checkAuthMiddleware.checkAuth, userController.update);
router.get('/teacherseesubjectmaterial', checkAuthMiddleware.checkAuth, announcementController.teacherseesubjectmaterial);
router.get('/viewsubjectmaterial', checkAuthMiddleware.checkAuth, announcementController.viewsubjectmaterial);
router.get('/studentseezoomlink', checkAuthMiddleware.checkAuth, announcementController.studentseezoomlink);
router.get('/studentpagehasIFhomeworkwassubmittedornot', checkAuthMiddleware.checkAuth, announcementController.studentpagehasIFhomeworkwassubmittedornot);

router.get('/teacherviewHomeworkofstudents', checkAuthMiddleware.checkAuth, announcementController.teacherviewHomeworkofstudents);

router.post('/teacheraddhomework', checkAuthMiddleware.checkAuth, announcementController.teacheraddhomework);

router.post('/teacherDeleteHomework', checkAuthMiddleware.checkAuth, announcementController.teacherDeleteHomework);

router.get('/studentcheckifHomeworkAvailable', checkAuthMiddleware.checkAuth, announcementController.studentcheckifHomeworkAvailable);

router.get('/view_student_teacher_class', checkAuthMiddleware.checkAuth, announcementController.view_student_teacher_class);
router.get('/viewsubjectmaterialstudent', checkAuthMiddleware.checkAuth, announcementController.viewsubjectmaterialstudent);

router.get('/sudentseeshersubjects', checkAuthMiddleware.checkAuth, announcementController.sudentseeshersubjects);
router.get('/viewSubCategory', checkAuthMiddleware.checkAuth, announcementController.viewsubcategory);
router.get('/teacherseeshersubjects', checkAuthMiddleware.checkAuth, announcementController.teacherseeshersubjects);
router.get('/viewSubs', checkAuthMiddleware.checkAuth, announcementController.viewsubs);
router.get('/viewallsubjects', checkAuthMiddleware.checkAuth, announcementController.viewsubectAllsubjects);
router.delete('/deleteAnounce' , checkAuthMiddleware.checkAuth, announcementController.deleteann );
module.exports = router;