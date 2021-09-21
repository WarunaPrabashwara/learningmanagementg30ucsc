const express = require('express');
const userController = require('../controllers/user.controller');
const checkAuthMiddleware = require('../middleware/check-auth');
const router = express.Router();

router.post('/register', userController.register);
router.post('/login', userController.login);
router.get('/viewusers', userController.viewusers);
router.put('/changepswd', checkAuthMiddleware.checkAuth, userController.changepswd);
router.get('/myprofile', checkAuthMiddleware.checkAuth, userController.myProfileData);
router.get('/viewTeachers', checkAuthMiddleware.checkAuth, userController.viewTeachers);
router.get('/viewStudents', checkAuthMiddleware.checkAuth, userController.viewStudents);
router.get('/viewPrincipal', checkAuthMiddleware.checkAuth, userController.viewPrincipal);
router.get('/viewSectionHead', checkAuthMiddleware.checkAuth, userController.viewSectionH);
router.get('/viewAdmin', checkAuthMiddleware.checkAuth, userController.viewAdmins);
module.exports = router;