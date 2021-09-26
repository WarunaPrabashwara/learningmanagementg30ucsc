const express = require('express');
const announcementController = require('../controllers/classes.controller');

const checkAuthMiddleware = require('../middleware/check-auth');
const router = express.Router();

router.post('/upload',checkAuthMiddleware.checkAuth, announcementController.register);
router.post('/addtoclassStudentsGroup',checkAuthMiddleware.checkAuth, announcementController.addtoclassStudentsGroup);

//router.delete('/delete', userController.delete);
//router.put('/update', checkAuthMiddleware.checkAuth, userController.update);
router.get('/view', checkAuthMiddleware.checkAuth, announcementController.view);
router.get('/viewClassesandStudents', checkAuthMiddleware.checkAuth, announcementController.viewClassesandStudents);

router.get('/viewMyAnnouncement', checkAuthMiddleware.checkAuth, announcementController.viewMyAnnouncement);
router.delete('/deleteAnounce' , checkAuthMiddleware.checkAuth, announcementController.deleteann );
module.exports = router;