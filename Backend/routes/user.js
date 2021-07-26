const express = require('express');
const userController = require('../controllers/user.controller');
const checkAuthMiddleware = require('../middleware/check-auth');
const router = express.Router();

router.post('/register', userController.register);
router.post('/login', userController.login);
router.put('/changepswd', checkAuthMiddleware.checkAuth, userController.changepswd);
router.get('/myprofile', checkAuthMiddleware.checkAuth, userController.myProfileData);

module.exports = router;