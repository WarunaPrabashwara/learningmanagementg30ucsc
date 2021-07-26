const express = require('express');
const imageController = require('../controllers/timetable.controller');
const imageUploader = require('../helpers/image-uploader');
const checkAuthMiddleware = require('../middleware/check-auth');
const router = express.Router();

router.post('/upload',checkAuthMiddleware.checkAuth, imageUploader.upload.single('image'), imageController.upload);
//router.delete('/delete', userController.delete);
//router.put('/update', checkAuthMiddleware.checkAuth, userController.update);
//router.get('/view', checkAuthMiddleware.checkAuth, userController.view);

module.exports = router;