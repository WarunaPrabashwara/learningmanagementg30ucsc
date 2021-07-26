const express = require('express');
const announcementController = require('../controllers/announcement.controller');

const checkAuthMiddleware = require('../middleware/check-auth');
const router = express.Router();

router.post('/upload',checkAuthMiddleware.checkAuth, announcementController.register);
//router.delete('/delete', userController.delete);
//router.put('/update', checkAuthMiddleware.checkAuth, userController.update);
router.get('/view', checkAuthMiddleware.checkAuth, announcementController.view);

module.exports = router;