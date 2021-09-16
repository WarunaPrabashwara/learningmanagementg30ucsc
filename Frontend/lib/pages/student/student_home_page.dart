import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../view_notice_board.dart';
import 'announcement.dart';
import 'package:frontend/pages/my_profile.dart';
import 'subjects._menue.dart';
import 'time_table.dart';
import 'subject.dart';


class StudentHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: const Text("Home"),
         ),
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(top: 8),
                 child: MaterialButton(
                   elevation: 5.0,
                   padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
                   color: Colors.blue,
                   minWidth: 300,
                   height: 60,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(30))
                   ),
                   child: Text("Profile"),
                   onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
                   },
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top :8),
                 child: MaterialButton(
                   elevation: 5.0,
                   padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
                   color: Colors.blue,
                   height: 60,
                   minWidth: 300,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(30))
                   ),
                   child: Text("Subjects"),
                   onPressed :() {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Subjects()));
                   },
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top:8),
                 child: MaterialButton(
                   elevation: 5.0,
                   padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
                   color: Colors.blue,
                   height: 60,
                   minWidth: 300,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(30))
                   ),
                   child: Text("Announcements"),
                   onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>view_notice_board()));
                   },

                 )
               ),
               Container(
                   margin: EdgeInsets.only(top:8),
                   child: MaterialButton(
                     elevation: 5.0,
                     padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
                     color: Colors.blue,
                     height: 60,
                     minWidth: 300,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(30))
                     ),
                     child: Text("Time Table"),
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>TimeTable()));
                     },

                   )
               ),
               Container(
                   margin: EdgeInsets.only(top:8),
                   child: MaterialButton(
                     elevation: 5.0,
                     padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
                     color: Colors.blue,
                     height: 60,
                     minWidth: 300,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(30))
                     ),
                     child: Text("Term Test Reports"),
                     onPressed: () {},

                   )
               ),
             ],
           ),
         ),
       )
    );
  }


}



