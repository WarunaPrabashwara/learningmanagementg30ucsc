import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import '../generate_term_test_report.dart';
import '../my_profile.dart';
import '../view_my_timetable.dart';
import '../view_notice_board.dart';

/*
import 'add_students_to_bucket_subjects.dart';
import 'my_subjects.dart';  //  or use  import 'package:frontend/pages/teacher/my_profile.dart';
*/
class sectionheadHomePage extends StatefulWidget {
  sectionheadHomePage({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<sectionheadHomePage> {
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

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return MyProfile();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('My Profile',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    final MySubjectsButon = Material(
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

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return view_notice_board();
                }),
              );

            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Announcement management',
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

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return view_notice_board();
                }),
              );            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text(' students Attendance',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final TimeTableButon = Material(
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

          appAuth.login().then((result) {
            if (result) {
              // Navigator.of(context).pushNamed('/teacher/student_to_bucket_sub');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return view_my_timetable();
                }),
              );
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Time Table Management',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final SeeTermTestReportButon = Material(
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

          appAuth.login().then((result) {
            if (result) {
              //Navigator.of(context).pushNamed('/generateTermTestReport');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return generate_term_test_reports();
                }),
              );
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Term Test Reports',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    /*
    final BucketSubButon = Material(
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

          appAuth.login().then((result) {
            if (result) {
              //Navigator.of(context).pushNamed('/generateTermTestReport');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return students_to_bucket_subjects();
                }),
              );
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },

        child: Text('Add students to bucket Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );*/


    return  Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      body:  new SingleChildScrollView(
          child: new Center(
              child: new Container(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(36.0),
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
                          MySubjectsButon,
                          SizedBox(height: 45.0),
                          AnnouncementButon,
                          SizedBox(height: 45.0),
                          TimeTableButon,
                          SizedBox(height: 45.0),
                          SeeTermTestReportButon,



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
