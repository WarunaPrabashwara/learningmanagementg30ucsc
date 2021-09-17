import 'dart:async';
import 'dart:convert';
import 'package:frontend/pages/detemyanouncement.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' ;
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';

class manageAnnouncements extends StatefulWidget {
  //const loginScreen({Key? key}) : super(key: key);

  @override
  _manageAnnouncements createState() => _manageAnnouncements();
}
class resp {
  String message;
  String userLevel;
  String token;
  resp(this.message, this.userLevel, this.token);


  factory resp.fromJson(dynamic json) {
    return resp(json['message'] as String, json['userLevel'] as String, json['token'] as String);
  }
  @override
  String toString() {
    return '{ ${this.message}, ${this.userLevel}, ${this.token} }';
  }
}
class respAnnouncement {
  String date_time;
  String description;
  String made_by;
  respAnnouncement(this.date_time, this.description, this.made_by);

  respAnnouncement.fromJson(Map<String, dynamic> json) {
    date_time = json['date_time'];
    description = json['description'];
    made_by = json['made_by'];
  }

  Map<String, dynamic> toJson() {
    return {
      'date_time': date_time,
      'description': description,
      'made_by': made_by
    };
  }
}
class _manageAnnouncements extends State<manageAnnouncements> {
    List<respAnnouncement> setofAnnouncements = [];
   String userLevel = "";
  bool isRememberMe = false;
    bool AvailAdmin = false;
    bool AvailPrin = false;
    bool AvailSec = false;
    bool AvailTeacher = false;
    bool AvailStudent = false;
  static const urlPrefix = 'http://10.0.2.2:2222';

  String announcement ;

  void _changeemail(String text) {
    setState(() {
      announcement = text;
    });
  } 
  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token') ;
    return tokenValue;
  }
    getTokenFromS3F() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('userLevel') ;
    return tokenValue;
  }



  Future<String> submitanouncement(  ) async {
    final url = Uri.parse('$urlPrefix/announcement/upload');
await getTokenFromSF().then(( token) async { 
    final headers = {        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};
        int a,b,c,d,e ;
        if( AvailAdmin ==true){  setState(() { a =1 ;  });} else { a = 0 ;};
        if( AvailPrin ==true){  setState(() { b =1 ;  });} else { b = 0 ;};
        if( AvailSec ==true){  setState(() {c =1 ;  });} else { c = 0 ;};
        if( AvailTeacher ==true){   setState(() { d =1 ;  });} else { d = 0 ;};
        if( AvailStudent ==true){  setState(() { e =1 ;  });} else { e = 0 ;};
    final json = '{"description": "${announcement}", "isAvailableForAdminssFlag": ${a}  ,"isAvailableForPrincipalsFlag": ${b},"isAvailableForSectionheadsFlag": ${c},"isAvailableForTeachersFlag": ${d} ,"isAvailableForStudentsFlag": ${e} }';
    print('user: ${json}');
     await post(url, headers: headers, body: json).then((response) async {
       print('usyyyyer: ${response.body}');
     }   ) ;
    

  //  resp user = resp.fromJson(jsonDecode(response.body));
//    print('user: ${user.message}');
  //  print('Status code: ${response.statusCode}');
  //  print('Body: ${response.body}');
    //final message = MessageGet(response);
   // return user ;
    
}) ;

  }

  Future<List<respAnnouncement>> anouncementviewRequest(  ) async {
        final url = Uri.parse('$urlPrefix/announcement/viewMyAnnouncement');
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
      print('user: ${anouncement[0].date_time}');
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
    print('Stde: ${snapshot}');
    return snapshot ;

     


  }

  String _status = '';
  Widget buildEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter Announcement',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 50,
          child: TextField(
              onChanged: (text) {
                _changeemail(text);
              },

              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.black87
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  hintText: '',
                  hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0
                  ),
  
              )
          ),
        )
      ],
    );
  }

  Widget buildLoginBtn(){
    return Container(
      padding: EdgeInsets.fromLTRB(100.0, 15.0, 100.0, 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: (){
          setState(() => this._status = 'loading');
          submitanouncement().then(( result) {
                     setState(() => this._status = 'Successfully submitted');
            print(result);
          
              Timer(Duration(seconds :3), (){
                  setState(() {

                       print("gggf");
                   
                         Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return manageAnnouncements();
                          }),
                        );

                       });
          });
    
           
          });
        },
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: Text(
          'Publish',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  Widget deleteOldAnouncementBtn(){
    return Container(
      padding: EdgeInsets.fromLTRB(100.0, 15.0, 100.0, 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return deleteMyAnouncements();
                }),
              ); 
        },
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: Text(
          'Delete my published announcements',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,

                            // Colors.blue.shade800,
                            // Colors.blue.shade800,
                          ]
                      )
                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 40
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        SizedBox(height: 20,),
      
                        buildEmail(),
      
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Column(children: [
                            SizedBox(
                             height: 25,
                             child: Checkbox(
                                value: this.AvailAdmin,
                               onChanged: (bool value) {
                              setState(() {
                                this.AvailAdmin = value;
                              });
                                                     },
                                                   ),
                           ),
                            SizedBox(
                            height: 25,
                            child: Checkbox(
                            value: this.AvailPrin,
                            onChanged: (bool value) {
                              setState(() {
                                this.AvailPrin = value;
                              });
                            },
                                                  ),
                          ),
                            SizedBox(
                          height: 25,
                          child: Checkbox(
                            value: this.AvailSec,
                            onChanged: (bool value) {
                              setState(() {
                                this.AvailSec = value;
                              });
                            },
                          ),
                        ),
                            SizedBox(
                           height: 25,
                           child: Checkbox(
                            value: this.AvailTeacher,
                            onChanged: (bool value) {
                              setState(() {
                                this.AvailTeacher = value;
                              });
                            },
                                                 ),
                         ),   
                            SizedBox(
                           height: 25,
                           child: Checkbox(
                            value: this.AvailStudent,
                            onChanged: (bool value) {
                              setState(() {
                                this.AvailStudent = value;
                              });
                            },
                                                 ),
                         ),                                               
                        ],),
                        Column(children: [
                          SizedBox(
                            height: 25,
                            child: Text(
                            'For Admins: ',
                            style: TextStyle(fontSize: 17.0),
                                                  ),
                          ), 
                          SizedBox(
                            height: 25,
                            child: Text(
                            'For Principals: ',
                            style: TextStyle(fontSize: 17.0),
                                                  ),
                          ),  
                          SizedBox(
                          height: 25,
                          child: Text(
                            'For section Heads: ',
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),  
                          SizedBox(
                          height: 25,
                          child: Text(
                            'For teachers: ',
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),      
                          SizedBox(
                           height: 25,
                           child: Text(
                            'For Students: ',
                            style: TextStyle(fontSize: 17.0),
                                                 ),
                         ),                                       
                        ],),
                 
                          ],
                        ),

                        SizedBox(height: 20,),

                        buildLoginBtn(),
                        
                        Text(_status),
                        SizedBox(height: 20,),
            
                        deleteOldAnouncementBtn(),

  

                      ],
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
