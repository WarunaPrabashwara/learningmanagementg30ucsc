import 'package:frontend/pages/changePassword.dart';
import 'package:frontend/pages/teacher/add_students_to_bucket_subjects.dart';
import 'package:frontend/pages/teacher/home.page.dart';
import 'package:frontend/pages/login.page.dart';
import 'package:frontend/pages/my_profile.dart';
import 'package:frontend/services/auth.service.dart';
import 'package:flutter/material.dart';

AuthService appAuth = new AuthService();

void main() async {
  // Set default home.
  Widget _defaultHome = new LoginPage();

  // Get result of the login function.
  bool _result = await appAuth.login();
  var _userLevel = 'teacher' ;
  if (_result) {
    if (_userLevel == 'teacher' ) {
      _defaultHome = new TeacherHomePage();
    }
    else if (_userLevel == 'student') {
      //
    }
    else {
      //
    }
  }

  // Run app!
  runApp(new MaterialApp(
    title: 'App',
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/teacher/home': (BuildContext context) => new TeacherHomePage(),
      '/login': (BuildContext context) => new LoginPage(title: 'Flutter Login'),
      //meke okkoma danna bAha hariyata wAda karanne naha ethakota
    },
  ));
}




