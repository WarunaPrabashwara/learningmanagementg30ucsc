import 'package:flutter/services.dart';
import 'package:frontend/pages/admin/dashboard.dart';
import 'package:frontend/pages/changePassword.dart';
import 'package:frontend/pages/principal/dashboard.dart';
//import 'package:frontend/pages/principal/homepage.dart';
import 'package:frontend/pages/section_head/dashboard.dart';
import 'package:frontend/pages/student/dashboard.dart';
import 'package:frontend/pages/teacher/add_students_to_bucket_subjects.dart';
import 'package:frontend/pages/teacher/dashboard.dart';
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
  var _userLevel = 'section_head' ;
  if (_result) {
    if (_userLevel == 'teacher' ) {
      _defaultHome = new DashboardTeacher();
    }
    else if (_userLevel == 'admin') {
      _defaultHome = new Dashboard();
    }
    else if (_userLevel == 'section_head') {
   //   _defaultHome = new Dashboard();
    }
    else if (_userLevel == 'principal') {
   //   _defaultHome = new sectionheadHomePage();
    }
    else if (_userLevel == 'student') {
    //  _defaultHome = new sectionheadHomePage();
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
      title: 'login',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: loginScreen(),
      routes: <String, WidgetBuilder>{
        // Set routes for using the Navigator.
        '/teacher/home': (BuildContext context) => new DashboardTeacher(),
        '/admin/home': (BuildContext context) => new Dashboard(),
        '/section_head/home': (BuildContext context) => new DashboardSectionHead(),
        '/student/home': (BuildContext context) => new DashboardStudent(),
        '/principal/home': (BuildContext context) => new DashboardPrincipal(),
        '/login': (BuildContext context) => new loginScreen(),
//meke okkoma danna bAha hariyata wAda karanne naha ethakota
      },
    );
  }
}
