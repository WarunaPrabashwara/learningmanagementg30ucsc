import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/admin/adduser.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class seeAssignedsubjeccs extends StatefulWidget {


  @override
  _UserMgtState createState() => _UserMgtState();
}

class respAnnouncement {

  String teacher_name;
  String class_name;
  String subject_name;
  int isHomeworkAvailFlag;
  String zoom_link;

  respAnnouncement(this.teacher_name, this.class_name ,this.subject_name, this.isHomeworkAvailFlag, this.zoom_link );

  respAnnouncement.fromJson(Map<String, dynamic> json) {
    teacher_name = json['teacher_name'];
    class_name = json['class_name'];
    subject_name = json['subject_name'];
    isHomeworkAvailFlag = json['isHomeworkAvailFlag'];
    zoom_link = json['zoom_link'];

    
  }

  Map<String, dynamic> toJson() {
    return {
      'teacher_name': teacher_name,
      'class_name': class_name,
      'subject_name': subject_name ,
      'isHomeworkAvailFlag': isHomeworkAvailFlag,
      'zoom_link': zoom_link,


    };
  }
}


class _UserMgtState extends State<seeAssignedsubjeccs> {
  int i =0;
  static const urlPrefix = 'http://10.0.2.2:2222';
  List<respAnnouncement> setofAnnouncements = [];
   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  
  Future<List<respAnnouncement>> AnouncementviewRequest(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/view_student_teacher_class');
    List<respAnnouncement> snapshot = await getTokenFromSF().then(( token) async {
      print('anment: ${token}');
      print('userse: ${token}');
      //  final headers = {"Content-type": "application/json "};
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

      // final json = '{"email": "${email}", "password": "${password}" }';
      //  print('user: ${json}');
      final response = await get(url, headers: headers );
      print('ususeusr: ${response.body}');
      final List t = json.decode(response.body);
      final List<respAnnouncement> anouncement =
      t.map((item) => respAnnouncement.fromJson(item)).toList();
     // respAnnouncement anouncement = respAnnouncement.fromJson(jsonDecode(response.body));
    //  print('user: ${anouncement[0].date_time}');
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
    print('Stde: ${snapshot}');
    return snapshot ;
  }

  
  Widget buildLoginBtn(){
    return Container(
      padding: EdgeInsets.fromLTRB(120.0, 10.0, 120.0, 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return adduser();
              }),
            );
        },
        padding: EdgeInsets.all(7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: Text(
          'Add a user',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
              if(i==0){
    AnouncementviewRequest().then(( result){
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements =result;
           });
         i=1;
    });
}
    return Scaffold(
      //backgroundColor: decor,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.shade800,
      //   title:
      //   Padding(
      //     padding: const EdgeInsets.all(18.0),
      //     child: Text(
      //       "User Management".toUpperCase(),
      //       style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 18.0,
      //           fontWeight: FontWeight.bold
      //       ),
      //     ),
      //   ),
      // ),
      body:   ListView.builder(
          //  padding: const EdgeInsets.all(8),
            itemCount: setofAnnouncements.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //height: 50,
                child: Column(
                  children: <Widget>[
                                                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
                          child: Center(
                            child: Text(
                            '${setofAnnouncements[index].subject_name }' + " " + '${setofAnnouncements[index].class_name }'+ " "+  '${setofAnnouncements[index].teacher_name }' ,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: (){},
                                child: Text("View".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.white),
                                        )
                                    )
                                ),
                              ),
                              SizedBox(width: 5,),
                              TextButton(
                                onPressed: (){},
                                child: Text("Edit".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.white),
                                        )
                                    )
                                ),
                              ),
                              SizedBox(width: 5,),
                              ElevatedButton(
                                onPressed: (){},
                                child: Text("DELETE".toUpperCase(), style: TextStyle(fontSize: 10),),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: Colors.white)
                                        )
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),



                  ]
                ),
              );
            }
        )
   
 ,
            

   
    );
  }
}
