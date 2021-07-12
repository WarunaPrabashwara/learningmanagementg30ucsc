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
//search bar
  }
}