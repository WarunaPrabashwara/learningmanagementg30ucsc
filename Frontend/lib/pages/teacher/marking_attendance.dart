import 'package:flutter/cupertino.dart';
import 'package:frontend/main.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class mark_attendance extends StatefulWidget {
  mark_attendance( {Key key, this.title}) : super(key: key);
  final String title;
  State<StatefulWidget> createState() => new _mark_attendanceState();
}

// ignore: camel_case_types
class _mark_attendanceState extends State<mark_attendance> {
  List<String> list = ["Science 7 A", "Maths 7 A", "Maths 7 B", "Maths 7 C"];
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';

  String get subject => subject;
  @override
  Widget build(BuildContext context) {





    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
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
                            SizedBox(
                              height: 10,
                            ),




                            SizedBox(
                              height: 40.0,
                              //width: 400,
                            ),
                            Text("Zoom link"),

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
