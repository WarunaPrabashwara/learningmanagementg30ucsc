import 'package:flutter/material.dart';
import 'package:frontend/pages/admin/addnewclass.dart';
import 'package:frontend/pages/admin/viewclasses.dart';
import 'package:frontend/pages/principal/student_list.dart';
import 'package:frontend/pages/principal/teacher_list.dart';

class studentandteeacherview extends StatefulWidget {


  @override
  _ClzMgtState createState() => _ClzMgtState();
}

class _ClzMgtState extends State<studentandteeacherview> {

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title:
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Class Management".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade300,
                    Colors.blue.shade900,

                  ]
              )
          ),
          //padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: (){
                                              Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return TeacherList();
                          }),
                        );
                    },
                    child: Text("view teachers list".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                //side: BorderSide(color: Colors.black)
                            )
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: ( ){
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return StudentList();
                          }),
                        );
                    },
                    child: Text("view students list".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                //side: BorderSide(color: Colors.black)
                            )
                        )
                    ),
                  ),
                ),


            ]
        ),
      )
    ),
    ),
    );
  }
}