import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/admin/class_management.dart';
import 'package:frontend/pages/admin/myProfile.dart';
import 'package:frontend/pages/admin/subject_management.dart';
import 'package:frontend/pages/admin/user_management.dart';
import 'package:frontend/pages/my_profile.dart';
import 'package:frontend/pages/uploadAnnouncement.dart';
import 'package:frontend/pages/view_notice_board.dart';
class Dashboard extends StatelessWidget {


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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        "You are Logged in as an Admin!",
                        style: TextStyle(
                            color: Colors.purple,
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
                                primary: Colors.purpleAccent.shade700,
                                padding: EdgeInsets.all(0)
                            ),
                            child: Container(
                              child: SizedBox(
                                width: 140.0,
                                height: 140.0,
                                child: Card(
                                  color: Colors.purpleAccent.shade400,
                                  //color: Color.fromARGB(200, 20, 21, 21),
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
                                        children: [
                                          SizedBox(height: 6.0),
                                          Image.asset("assets/loudspeaker.png", width: 48.0,),
                                          SizedBox(height: 10.0),
                                          Text("Announcement Management", style: TextStyle(
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
                                        children: [
                                          SizedBox(height: 6.0),
                                          Image.asset("assets/noticeboard.png", width: 68.0,),
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
                                          SizedBox(height: 6.0),
                                          Image.asset("assets/book.png", width: 58.0,),
                                          SizedBox(height: 10.0),
                                          Text("Subject Management", style: TextStyle(
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
                                  return SubMgt();
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
                                        children: [
                                          SizedBox(height: 2.0),
                                          Image.asset("assets/presentation.png", width: 64.0,),
                                          SizedBox(height: 10.0),
                                          Text("Class Management", style: TextStyle(
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
                                  return ClzMgt();
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


