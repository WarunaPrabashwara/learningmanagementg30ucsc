import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/teacher/upload_test_test_mark.dart';

import 'mark_homework.dart';
import 'marking_attendance.dart';


// ignore: camel_case_types
class subject_Matirials_ofTeacher extends StatefulWidget {
  subject_Matirials_ofTeacher(String subject, {Key key, this.title}) : super(key: key);
  final String title;
  State<StatefulWidget> createState() => new _subject_Matirials_ofTeacherState();
}

// ignore: camel_case_types
class _subject_Matirials_ofTeacherState extends State<subject_Matirials_ofTeacher> {
  List<String> list = ["matirial1ggggggggggggggggggggggggggggggg", "matirial2", "matirial3"];
  List<String> list2 = ["kamal's", "nimal's", "amal's"];
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';

  String get subject => subject;
  @override
  Widget build(BuildContext context) {


    final MarkAttendanceButon = Material(
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
                  return mark_attendance();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Mark Atendance',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final UploadTermTestMarksButon = Material(
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
                  return upload_term_test_marks();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Upload Term Test Marks',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final DeleteHWButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(


        onPressed: () {
          setState(() => this._status = 'loading');

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  //        return MyProfile();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Delete H/W',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    final AddNewHWButton = Material(
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
          //        return MyProfile();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Add new H/W and Delete old',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final maerial = Material(
      child:
      Column(

        children: list.map((String data) {
          return Container(
            child: GestureDetector(
              onTap: () {

              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(

                      children :[
                        SizedBox(
                        width: MediaQuery.of(context).size.width -180 ,
                          child: Column(
                            children :[

                                   Align(
                                     alignment: Alignment.centerLeft,
                                     child: Text(
                                      data,
                                      style: TextStyle(
                                        color: Color(0xFFF05A22),
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                  ),
                                   ),


                            ]
                          ),
                        ),
                        SizedBox(
                        //  width: 90,
                          child: Column(
                            children : [


                                Align(
                                  alignment: Alignment.centerRight,
                                  child: MaterialButton(
                                    //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      setState(() => this._status = 'loading');

                                      appAuth.login().then((result) {
                                        if (result) {
                                          setState(() => this._status = '');
                                          // Navigator.of(context).pushNamed('/teacher/student_to_bucket_sub');

                                        } else {
                                          setState(() => this._status = 'something went wrong ! try again');
                                        }
                                      });
                                    },
                                    child: Text('Delete',
                                        textAlign: TextAlign.center,
                                        style: style.copyWith(
                                            color: Colors.black, fontWeight: FontWeight.bold)),
                                  ),
                                ),

                            ]
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
            ),
          );

        }).toList(),
      ),
    );

    final Homeworklist = Material(
      child:
      Column(

        children: list2.map((String data) {
          return Container(
            child: GestureDetector(
              onTap: () {

              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(

                      children :[
                        SizedBox(
                          width: MediaQuery.of(context).size.width -180 ,
                          child: Column(
                              children :[

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    data,

                                    style: TextStyle(
                                      color: Color(0xFFF05A22),
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),


                              ]
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: Column(
                              children : [


                                Align(
                                  alignment: Alignment.centerRight,
                                  child: MaterialButton(
                                    //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      setState(() => this._status = 'loading');

                                      appAuth.login().then((result) {
                                        if (result) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) {
                                                      return mark_homework();
                                            }),
                                          );
                                          // Navigator.of(context).pushNamed('/teacher/student_to_bucket_sub');

                                        } else {
                                          setState(() => this._status = 'something went wrong ! try again');
                                        }
                                      });
                                    },
                                    child: Text('Check',
                                        textAlign: TextAlign.center,
                                        style: style.copyWith(
                                            color: Colors.black, fontWeight: FontWeight.bold)),
                                  ),
                                ),

                              ]
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
            ),
          );

        }).toList(),
      ),
    );

    final AddnewMatirialButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(

        onPressed: () {
          setState(() => this._status = 'loading');

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return mark_attendance();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Add new Material',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(""),
        // ),
        body:  new SingleChildScrollView(
            child: new Center(
                child: new Container(
                  //  color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 10,),
                            Text("Materials"),
                            SizedBox(height: 10,),
                            maerial,
                            SizedBox(height: 10,),
                            AddnewMatirialButon,
                            SizedBox(height: 10,),
                            Text("Zoom link"),
                            SizedBox(height: 10,),
                            MarkAttendanceButon,
                            SizedBox(height: 10,),
                            Text("Home Works of childern"),
                            SizedBox(height: 10,),
                            Homeworklist,
                            SizedBox(height: 10,),
                            DeleteHWButton,
                            SizedBox(height: 10,),
                            AddNewHWButton,
                            SizedBox(height: 10,),
                            UploadTermTestMarksButon,
                            SizedBox(height: 10.0),



                          ],
                        )
                    )
                )
            )

        ),
      ),
    );
  }
}
