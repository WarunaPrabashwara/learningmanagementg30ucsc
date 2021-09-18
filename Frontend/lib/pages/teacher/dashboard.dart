import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import '../generate_term_test_report.dart';
import '../my_profile.dart';
import '../view_my_timetable.dart';
import '../view_notice_board.dart';
import 'add_students_to_bucket_subjects.dart';
import 'my_subjects.dart';  //  or use  import 'package:frontend/pages/teacher/my_profile.dart';


class DashboardTeacher extends StatefulWidget {
  DashboardTeacher({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _DashboardTeacher();
}

class _DashboardTeacher extends State<DashboardTeacher>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
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
              "You are Logged in as a Teacher".toUpperCase(),
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
                                  "Hello Teacher!",
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
                                                    Image.asset("assets/book.png", width: 60.0,),
                                                    SizedBox(height: 10.0),
                                                    Text("My Subjects", style: TextStyle(
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
                                            return my_subjects_ofTeacher();
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
                                                    Image.asset("assets/calendar.png", width: 60.0,),
                                                    SizedBox(height: 10.0),
                                                    Text("My Time Table", style: TextStyle(
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
                                            return view_my_timetable();
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
                                                    Image.asset("assets/report-card.png", width: 60.0,),
                                                    SizedBox(height: 10.0),
                                                    Text("Term Test Reports", style: TextStyle(
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
                                                    Image.asset("assets/category.png", width: 50.0,),
                                                    SizedBox(height: 10.0),
                                                    Text("Add students to bucket Subjects", style: TextStyle(
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
                                            return students_to_bucket_subjects();
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