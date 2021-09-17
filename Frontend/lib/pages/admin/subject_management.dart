import 'package:flutter/material.dart';
import 'package:frontend/pages/admin/add_new_subject.dart';
import 'package:frontend/pages/admin/addsubcatogery.dart';
import 'package:frontend/pages/admin/addsubjects.dart';
import 'package:frontend/pages/admin/mainassignsubjctwithteacherandlass.dart';
import 'package:frontend/pages/admin/viewSubjectcatogory.dart';
import 'package:frontend/pages/viewsubjects.dart';

class SubMgt extends StatefulWidget {


  @override
  _SubMgtState createState() => _SubMgtState();
}

class _SubMgtState extends State<SubMgt> {
  var sub1 = "Science";
  var sub2 = "Mathematics";
  var sub3 = "Physics";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: decor,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title:
              Center(
                child: Text(
                "Subject Management".toUpperCase(),
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
                  padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                  child: Center(
                    child: Text(
                      "Subject Categories",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: (){
                                              Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return viewsubjectcatogories();
                          }),
                        );
                    },
                    child: Text("view".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
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
                            return addsubcatogory();
                          }),
                        );
                    },
                    child: Text("add new".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
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
                  padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                  child: Center(
                    child: Text(
                      "Subjects",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: (){
                                              Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return viewsubjects();
                          }),
                        );
                    },
                    child: Text("view".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
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
                            return addsubject();
                          }),
                        );
                    },
                    child: Text("add new".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
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
                  padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                  child: Center(
                    child: Text(
                      "-------------------------",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SubjectTeacherClass();
                          }),
                        );          
                    },
                    child: Text("Assign subjects with\n\t\t teacher and class".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

