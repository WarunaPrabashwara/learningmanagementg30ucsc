import 'package:flutter/cupertino.dart';
import 'package:frontend/main.dart';
import 'package:flutter/material.dart';

import 'changePassword.dart';


class view_notice_board extends StatefulWidget {
  State<StatefulWidget> createState() => new _view_notice_boardState();
}

class _view_notice_boardState extends State<view_notice_board> {
  final List<String> names = <String>['Change time Table', 'Change uniform', 'changed school them', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<String> names2 = <String>['From principal', 'From admin', 'From principal', 'From principal', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<String> names3 = <String>['2020-6-1 7:59', '2020-6-1 7:59', '2020-6-1 7:59', '2020-6-1 7:59', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<String> names4 = <String>['we inform yfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffffffffou all that we are......', 'we inform yoyfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffffffffouu all that we are......', 'we inform you all that we are......', 'we inform yoyfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggfffffffffffffffffffffffffffffffffyfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggffffffffffffffffyfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffffffffoufffffffffffffffffffffffffffffffffffffouffffffffffffffffffffouu all that we are......', 'Bob', 'Charlie', 'Cook', 'Carline'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tutorial - googleflutter.com'),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.blue[400],
                child: Column(
                  children: <Widget>[
                     Text('${names[index]}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('${names2[index]} ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text('${names3[index]}',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text('${names4[index]} ',
                      style: TextStyle(fontSize: 14),
                    )
                  ]
                ),
              );
            }
        )
    );
  }
}










