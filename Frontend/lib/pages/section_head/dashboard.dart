import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/section_head/timetablemanagement.dart';
import 'package:frontend/pages/uploadAnnouncement.dart';
import '../generate_term_test_report.dart';
import '../my_profile.dart';
import '../view_my_timetable.dart';
import '../view_notice_board.dart';

class DashboardSectionHead extends StatefulWidget {


  @override
  _DashboardSectionHead createState() => _DashboardSectionHead();
}

class _DashboardSectionHead extends State<DashboardSectionHead> {
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
              "You are Logged in as a Section Head".toUpperCase(),
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
                              "You are Logged in as a Section Head!",
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
                                              SizedBox(height: 15.0),
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
                                              Image.asset("assets/loudspeaker.png", width: 60.0,),
                                              SizedBox(height: 10.0),
                                              Text("Announcement Management", style: TextStyle(
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
                                      return manageAnnouncements();
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
                                              SizedBox(height: 7.0),
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
                                              Text("Time Table Management", style: TextStyle(
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
                                      return ttmanagement();
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
                                              Text("Term Tests Reports", style: TextStyle(
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

                             /* ElevatedButton(
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
                                              Text("User Management", style: TextStyle(
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
                                      return UserMgt();
                                    }),
                                  );
                                },
                              ),*/



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