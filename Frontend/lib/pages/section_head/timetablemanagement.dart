import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/section_head/ttOfStudent.dart';
import 'package:frontend/pages/section_head/ttOfTeacher.dart';
import '../generate_term_test_report.dart';
import '../my_profile.dart';
import '../view_my_timetable.dart';
import '../view_notice_board.dart';

/*
import 'add_students_to_bucket_subjects.dart';
import 'my_subjects.dart';  //  or use  import 'package:frontend/pages/teacher/my_profile.dart';
*/
class ttmanagement extends StatefulWidget {
  ttmanagement({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _ttmanagement();
}

class _ttmanagement extends State<ttmanagement> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  @override
  Widget build(BuildContext context){

    final ttOfTeacher = Material(
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
                  return ttofteacher();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Add a time table of a teacher',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    final ttOfStudent = Material(
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
                  return ttofstudent();
                }),
              );

            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Add a time table of a student',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );




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
                          ttOfTeacher,
                          SizedBox(height: 45.0),
                          ttOfStudent,
                          SizedBox(height: 45.0),

                  //        Text('${this._status}',)

                        ],
                      )
                  )
              )
          )

      ),
    );
  }

}
