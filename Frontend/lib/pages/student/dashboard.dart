import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/generate_term_test_report.dart';
import '../view_notice_board.dart';
import 'announcement.dart';
import 'package:frontend/pages/my_profile.dart';
import 'subjects._menue.dart';
import 'time_table.dart';
import 'subject.dart';


class DashboardStudent extends StatefulWidget {
  DashboardStudent({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _DashboardStudent();
}

class _DashboardStudent extends State<DashboardStudent> {
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
              "You are Logged in as a Student".toUpperCase(),
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
                          Colors.white,
                          Colors.white70,
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
                                      backgroundColor: Colors.purple.shade300,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.menu,
                                          color: Colors.purple.shade900,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.notifications_active),
                                          onPressed: (){},
                                          iconSize: 35.0,
                                          color: Colors.purple.shade400,
                                        ),
                                        //SizedBox(width: 10.0,),

                                        IconButton(
                                          icon: Icon(Icons.person_rounded),
                                          onPressed: (){},
                                          iconSize: 45.0,
                                          color: Colors.purple.shade400,
                                        ),
                                        SizedBox(width: 5.0,),
                                      ],
                                    )
                                  ]
                              )
                          ),

                          Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                child: Text(
                                  "You are Logged in as a student !",
                                  style: TextStyle(
                                      color: Colors.purple,
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
                                          primary: Colors.purpleAccent.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                              color: Colors.purpleAccent.shade400,
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
                                                    SizedBox(height: 13.0),
                                                    Text("My Profile", style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16.0
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
                                          primary: Colors.purpleAccent.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Colors.purpleAccent.shade400,
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
                                                    Text("Subjects", style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16.0,
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
                                            return Subjects();
                                          }),
                                        );
                                      },
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          primary: Colors.purpleAccent.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Colors.purpleAccent.shade400,
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
                                                    Image.asset("assets/noticeboard.png", width: 70.0,),
                                                    SizedBox(height: 5.0),
                                                    Text("View Noticeboard", style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16.0,
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
                                          primary: Colors.purpleAccent.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Colors.purpleAccent.shade400,
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
                                                    Image.asset("assets/calendar.png", width: 70.0,),
                                                    SizedBox(height: 8.0),
                                                    Text("Time Table", style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16.0,
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
                                            return TimeTable();
                                          }),
                                        );
                                      },
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          primary: Colors.purpleAccent.shade700,
                                          padding: EdgeInsets.all(0)
                                      ),
                                      child: Container(
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 140.0,
                                          child: Card(
                                            color: Colors.purpleAccent.shade400,
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
                                                      fontSize: 16.0,
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

                            /*        ElevatedButton(
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
*/


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