import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/principal/teacher_list.dart';
import 'package:frontend/pages/uploadAnnouncement.dart';
import 'package:frontend/pages/viewsubjects.dart';
import '../generate_term_test_report.dart';
import '../my_profile.dart';
import '../view_notice_board.dart';
//import '../generate_term_test_report.dart';
import '../view_students_attendance.dart';
import 'subjectList.dart';
//import 'details_list.dart';

class PrincipalHomePage extends StatefulWidget {
  PrincipalHomePage({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<PrincipalHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  @override
  Widget build(BuildContext context){

    final MyProfileButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');


              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return MyProfile();
                }),

          );
        },
        child: Text('My Profile',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final anouncementmanagement = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
             Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context)=>manageAnnouncements()));
        },
        child: Text('Announcement Management',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    final AnnouncementButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return view_notice_board();
                }),
          );
        },
        child: Text('Announcements',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final SubjectListButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return viewsubjects();
                }),
              );
        },
        child: Text('Subject List',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final UserDetailsButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return TeacherList();
                }),
            );
        },
        child: Text('Students and Teachers List',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final AttendanceReportButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return view_attendance();
                }),
              );
        },
        child: Text('Attendance of Students and Teachers',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final TermTestReportsButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return generate_term_test_reports();
                }),
              );
        },
        child: Text('Term Test Reports of Students',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return  Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Home'),
      // ),
      body:  new SingleChildScrollView(
          child: new Center(
              child: new Container(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(height: 45.0),
                          MyProfileButon,
                          SizedBox(height: 45.0),
                          anouncementmanagement ,
                          SizedBox(height: 45.0),
                          AnnouncementButon,
                          SizedBox(height: 45.0),
                          SubjectListButon,
                          SizedBox(height: 45.0),
                          UserDetailsButon,
                          SizedBox(height: 45.0),
                          AttendanceReportButon,
                          SizedBox(height: 45.0),
                          TermTestReportsButon,

                          Text('${this._status}',)

                        ],
                      )
                  )
              )
          )

      ),
    );
  }

}
