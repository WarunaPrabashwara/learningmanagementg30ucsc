import 'package:flutter/services.dart';
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
  Widget _defaultHome = new loginScreen();

  // Get result of the login function.
  bool _result = await appAuth.login();
  var _userLevel = 'teacher' ;
  if (_result) {
    if (_userLevel == 'teacher' ) {
      _defaultHome = new loginScreen();
    }
    else if (_userLevel == 'student') {
      //
    }
    else {
      //
    }
  }

  // Run app!
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue.shade800,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login in',
      theme: ThemeData(
          primarySwatch: Colors.amber
      ),
      home: loginScreen(),
      routes: <String, WidgetBuilder>{
        // Set routes for using the Navigator.
        '/teacher/home': (BuildContext context) => new loginScreen(),
        '/login': (BuildContext context) => new loginScreen(),
//meke okkoma danna bAha hariyata wAda karanne naha ethakota
      },
    );
  }
}
