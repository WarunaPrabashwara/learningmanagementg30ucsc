
import 'package:flutter/material.dart';
import 'package:frontend/pages/section_head/timetablemanagement.dart';
import 'package:frontend/pages/uploadAnnouncement.dart';
import '../generate_term_test_report.dart';
import '../my_profile.dart';
import '../view_notice_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/pages/my_profile.dart';
import 'package:frontend/pages/view_notice_board.dart';


class sectionheadHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   //backgroundColor: Colors.blue.shade700,
      //   backwardsCompatibility: false,
      //   systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.orange),
      // ),
      //backgroundColor: Colors.black,
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
                          Image.asset("assets/man-user", width: 50.0,),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      "Hello Section Head!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
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
                                      Image.asset("assets/team.png", width: 60.0,),
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
                            primary: Colors.blue.shade900,
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
                                      SizedBox(height: 6.0),
                                      Image.asset("assets/loudspeaker.png", width: 48.0,),
                                      SizedBox(height: 10.0),
                                      Text("Notice Board", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0
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
                            primary: Colors.blue.shade900,
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
                                      Image.asset("assets/clock.png", width: 50.0,),
                                      SizedBox(height: 10.0),
                                      Text("Time Table Management", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0
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
                            primary: Colors.blue.shade800,
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
                                      SizedBox(height: 6.0),
                                      Image.asset("assets/book.png", width: 58.0,),
                                      SizedBox(height: 10.0),
                                      Text("Term Test reports", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0
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


                    ],
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

