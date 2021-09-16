import 'package:frontend/main.dart';
import 'package:flutter/material.dart';

class TeacherList extends StatefulWidget {
  TeacherList({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title:
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Teacher List".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),

        body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
              child: Center(
                child: Text(
                  "Teachers",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
        ]
      ),
//search bar
      )
    ),
    );
  }
}