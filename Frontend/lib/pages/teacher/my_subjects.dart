import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/teacher/subject_materials.dart';


// ignore: camel_case_types
class my_subjects_ofTeacher extends StatefulWidget {
  my_subjects_ofTeacher({Key key, this.title}) : super(key: key);
  final String title;
  State<StatefulWidget> createState() => new _my_subjects_ofTeacherState();
}

// ignore: camel_case_types
class _my_subjects_ofTeacherState extends State<my_subjects_ofTeacher> {
  List<String> list = ["Science 7 A", "Maths 7 A", "Maths 7 B", "Maths 7 C"];
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  @override
  Widget build(BuildContext context) {

    final SubMaterialButon = Material(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list.map((String data) {
          return Container(
            height: 50.0,
            child: GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return subject_Matirials_ofTeacher(data);
                  }),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFF05A22),
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
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
                    )
                  ],
                ),
              ),
            ),
          );

        }).toList(),
      ),


    );



    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack Overflow"),
        ),
        body: Center(
          child: SubMaterialButon,
        ),
      ),
    );
  }
}
