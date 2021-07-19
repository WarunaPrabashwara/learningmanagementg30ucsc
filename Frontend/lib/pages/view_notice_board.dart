import 'package:flutter/cupertino.dart';
import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'changePassword.dart';


class view_notice_board extends StatefulWidget {
  State<StatefulWidget> createState() => new _view_notice_boardState();
}

class _view_notice_boardState extends State<view_notice_board> {
  final List<String> names = <String>['Change time Table', 'Change uniform', 'changed school them', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<String> names2 = <String>['Mr Waruna', ' Mr nimesh', ' principal', ' principal', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<String> names3 = <String>['2020-6-1 7:59', '2020-6-1 7:59', '2020-6-1 7:59', '2020-6-1 7:59', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<String> names4 = <String>['we inform yfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffffffffou all that we are......', 'we inform yoyfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffffffffouu all that we are......', 'we inform you all that we are......', 'we inform yoyfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggfffffffffffffffffffffffffffffffffyfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggffffffffffffffffyfffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffffffffoufffffffffffffffffffffffffffffffffffffouffffffffffffffffffffouu all that we are......', 'Bob', 'Charlie', 'Cook', 'Carline'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Announcements'),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //height: 50,

                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 380.0,
                        height: 140.0,
                        child: Card(
                          color: Colors.grey[200],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 1.0, 8.0),
                                      child: AutoSizeText('${names[index]}',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                                      child: AutoSizeText('${names3[index]}',style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${names4[index]} ',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AutoSizeText("-"+'${names2[index]} ',style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                  ]
                ),
              );
            }
        )
    );
  }
}










