const express = require('express');
const imageController = require('../controllers/timetable.controller');
const imageUploader = require('../helpers/image-uploader');
const checkAuthMiddleware = require('../middleware/check-auth');
const router = express.Router();

router.post('/upload',checkAuthMiddleware.checkAuth, imageUploader.upload.single('image'), imageController.upload);
//router.delete('/delete',imageUploader.remove.single('image'), imageController.removeFiles);
//router.delete('/delete', userController.delete);
//router.put('/update', checkAuthMiddleware.checkAuth, userController.update);
//router.get('/view', checkAuthMiddleware.checkAuth, imageController.view);

module.exports = router;