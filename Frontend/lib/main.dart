import 'package:frontend/pages/changePassword.dart';
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
  if (_result) {
    _defaultHome = new HomePage();
  }

  // Run app!
  runApp(new MaterialApp(
    title: 'App',
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/teacher/home': (BuildContext context) => new HomePage(),
      '/teacher/my_profile': (BuildContext context) => new MyProfile(),
      '/login': (BuildContext context) => new LoginPage(title: 'Flutter Login'),
      '/changePassword' : (BuildContext context) => new changepassword()
    },
  ));
}




