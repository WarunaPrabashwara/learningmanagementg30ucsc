import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/principal/studentandteacherlist.dart';
import 'package:frontend/pages/principal/teacher_list.dart';
import 'package:frontend/pages/uploadAnnouncement.dart';
import 'package:frontend/pages/viewsubjects.dart';
import '../generate_term_test_report.dart';
import '../my_profile.dart';
import '../view_notice_board.dart';
//import '../generate_term_test_report.dart';
import '../view_students_attendance.dart';
import 'subjectList.dart';
//import 'details_list.dart';


class DashboardPrincipal extends StatefulWidget {
  DashboardPrincipal({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _DashboardPrincipal();
}

class _DashboardPrincipal extends State<DashboardPrincipal> {
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);
  String _status = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title:
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "You are Logged in as a Principal".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
          ),

        ),
         ),
*/
        body:
        SafeArea(
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

                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey[200],
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.menu,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.notifications_active),
                                          onPressed: (){},
                                          iconSize: 30.0,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(width: 10.0,),
                                        Image.asset("assets/man-user.png", width: 50.0,),
                                      ],
                                    )
                                  ]
                              )
                          ),

                          Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Text(
                                  "Hello Principal!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                          ),

                          SizedBox(height: 18.0,),
                          Center(
                              child: Wrap(
                                  spacing: 25.0,
                                  runSpacing: 30.0,
                                  children: [

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          primary: Colors.blue.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Color.fromARGB(200, 20, 21, 21),
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 15.0),
                                                    Image.asset("assets/userX.png", width: 58.0,),
                                                    SizedBox(height: 15.0),
                                                    Text("My Profile", style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.0
                                                    ),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return MyProfile();
                                          }),
                                        );
                                      },
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          primary: Colors.blue.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Color.fromARGB(200, 20, 21, 21),
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset("assets/loudspeaker.png", width: 60.0,),
                                                    SizedBox(height: 10.0),
                                                    Text("Announcement Management", style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                    ),textAlign: TextAlign.center,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return manageAnnouncements();
                                          }),
                                        );
                                      },
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          primary: Colors.blue.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Color.fromARGB(200, 20, 21, 21),
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset("assets/noticeboard.png", width: 60.0,),
                                                    SizedBox(height: 10.0),
                                                    Text("View Noticeboard", style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                    ),textAlign: TextAlign.center,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return view_notice_board();
                                          }),
                                        );
                                      },
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          primary: Colors.blue.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Color.fromARGB(200, 20, 21, 21),
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset("assets/bookshelf.png", width: 60.0,),
                                                    SizedBox(height: 10.0),
                                                    Text("Subject List", style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                    ),textAlign: TextAlign.center,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return viewsubjects();
                                          }),
                                        );
                                      },
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          primary: Colors.blue.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Color.fromARGB(200, 20, 21, 21),
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset("assets/team.png", width: 60.0,),
                                                    SizedBox(height: 10.0),
                                                    Text("Students and Teachers List", style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                    ),textAlign: TextAlign.center,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return studentandteeacherview();
                                          }),
                                        );
                                      },
                                    ),

                                     ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                        primary: Colors.blue.shade700,
                                        padding: EdgeInsets.all(0)
                                ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Color.fromARGB(200, 20, 21, 21),
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                      ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                      Image.asset("assets/report-card.png", width: 50.0,),
                                                      SizedBox(height: 10.0),
                                                    Text("Term Test Reports of Students", style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                              ),textAlign: TextAlign.center,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return generate_term_test_reports();
                                    }),
                                  );
                                },
                              ),



                                  ]
                              )
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}