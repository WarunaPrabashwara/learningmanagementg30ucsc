import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:shared_preferences/shared_preferences.dart';

class view_my_timetable extends StatefulWidget {
  view_my_timetable({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _view_my_timetable();
}


  class _view_my_timetable extends State<view_my_timetable> {
    String _email ;
  String _token ;
  //  static const urlPrefix = 'http://10.0.2.2:2222';

    getTokenFromSF() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenValue = prefs.getString('token');
      return tokenValue;
    }
    getTokenFromSF2() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email');
      return email;
    }
  @override
  Widget build(BuildContext context) {

    double displaywidth = MediaQuery.of(context).size.width ;
    getTokenFromSF().then(( token) async {
      setState(() {
        _token = token;
      });
    }  );
    getTokenFromSF2().then(( email) async {
      setState(() {

        _email = email;
      });
    }  );

    var url = Uri.parse("http://10.0.2.2:2222/uploads/timetables/$_email.png");
    var title = 'Web Images';
    //final url = Uri.parse('$urlPrefix/uploads/timetables/' + this.email + '.png');
  //  String urlink = url.toString();
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:SingleChildScrollView(


            child:
                Container(

                    width:displaywidth,
                  // height: double.infinity,
                  child:
                    CachedNetworkImage(
                    imageUrl: url.toString()  ,
                  httpHeaders: {
                    "authorization" : "Bearer $_token"
                  },
                    placeholder:(context ,url ) =>CircularProgressIndicator() ,
                    errorWidget:(context, url ,error )=>Text("your time table is not available") ,
                  fit: BoxFit.fitWidth,

                  ),


              ),


        )

      ),
    );
  }
}


//meka hot reaload krhm wAda .eek flutter wla aulk