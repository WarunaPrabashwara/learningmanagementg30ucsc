import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class mark_homework extends StatefulWidget {
    final String title;
  const mark_homework(this.title);
  State<StatefulWidget> createState() => new _mark_homeworkState();
}

class profiledata {
 
  String message;

  profiledata(  this.message);


  factory profiledata.fromJson(dynamic json) {
    return profiledata(  json['message'] as String);
  }
  @override
  String toString() {
    return '{ ${this.message}}';
  }
}

class homework {

  String teacher_name;
  String class_name;
  String subject_name;
    String studentUserName; 
  String submission_text;
  String title;
  String submission_location;
    String mark;  
  homework(this.teacher_name, this.class_name, this.subject_name , this.studentUserName , this.submission_text, this.title, this.submission_location , this.mark );

  homework.fromJson(Map<String, dynamic> json) {
    teacher_name = json['teacher_name'];
    class_name = json['class_name'];
    subject_name = json['subject_name'];
    studentUserName = json['studentUserName'];
        submission_text = json['submission_text'];
    title = json['title'];
    submission_location = json['submission_location'];
    mark = json['mark'];
    
  }

  Map<String, dynamic> toJson() {
    return {
      'teacher_name': teacher_name,
      'class_name': class_name,
      'subject_name': subject_name,  
      'studentUserName': studentUserName ,
            'submission_text': submission_text,
      'title': title,
      'submission_location': submission_location,  
      'mark': mark 

    };
  }
}



class _mark_homeworkState extends State<mark_homework> {
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    String _value = "";
 
  bool isRememberMe = false;
  static const urlPrefix = 'http://10.0.2.2:2222';

  String section ;
  String grade  ;
     int k =0 ;
     String mark ;
     String teacher_name ;
String subject_name ;
String class_name;
String studentUserName ;
  
      List<homework> setofAnnouncements3 = [];

  

  void _fulname(String text) {
    setState(() {
      section = text;
    });
  }

  void _gradesetter(String text) {
    setState(() {
      grade = text;
    });
  }

  
   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
      Future<List<homework>> AnouncementviewRequest3(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/teacherviewHomeworkofstudents?class_name='+ class_name +'&teacher_name=' + teacher_name + '&subject_name='+ subject_name);
    List<homework> snapshot = await getTokenFromSF().then(( token) async {
 //     print('anment: ${token}');
  //    print('userse: ${token}');
      //  final headers = {"Content-type": "application/json "};
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

      // final json = '{"email": "${email}", "password": "${password}" }';
      //  print('user: ${json}');
      final response = await get(url, headers: headers );
   //   print('ususeusr: ${response.body}');
      final List t = json.decode(response.body);
      final List<homework> anouncement =
      t.map((item) => homework.fromJson(item)).toList();
     // respAnnouncement anouncement = respAnnouncement.fromJson(jsonDecode(response.body));
    //  print('user: ${anouncement[0].date_time}');
    //  print('Status code: ${response.statusCode}');
    //  print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
    print('Stde: ${snapshot}');
    return snapshot ;
  }

    void _changeemail(String text) {
    setState(() {
      mark = text;
    });
  }


  

  Future<void> loginPostRequest3(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/teacheraddmark');

     await getTokenFromSF().then(( token) async {

    final headers = {  'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

    final json = '{"teacher_name": "${teacher_name}" ,"class_name": "${class_name}" ,"subject_name": "${subject_name}" ,"studentUserName": "${studentUserName}" , "mark": "${mark}"  }';
    print('user: ${json}');
    final response = await post(url, headers: headers, body: json);
    print('usyyyyer: ${response.body}');
    //  profiledata dataset = profiledata.fromJson(jsonDecode(response.body));

    //resp user = resp.fromJson(jsonDecode(response.body));
  //  print('user: ${user.message}');
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    //final message = MessageGet(response);
  //  return user ;
  setState(() => this._status = response.body.toString());
    });

  }


  String _status = '';
  Widget fullname(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter Section',
          style: TextStyle(
              color: Colors.white,
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
                _fulname(text);
              },

              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.black87
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
               //   hintText: 'Enter your user ID',
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
  Widget subclass(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter Class',
          style: TextStyle(
              color: Colors.white,
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
                _gradesetter(text);
              },

              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.black87
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
               //   hintText: 'Enter your user ID',
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
         // setState(() => this._status = 'loading');
            loginPostRequest3() ;

          Timer(Duration(seconds :3), (){
                  setState(() {
                        
          setState(() => this._status = 'uploaded marks successfully');
                   //     Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return mark_homework(widget.title  );
                          }),
                        );

                 
                       print("gggf");
                    //   print(dob);
                         Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return mark_homework( widget.title);
                          }),
                        );

                       });
          });
   
        },
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: Text(
          'Add',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  List<String> _students = ['admin'] + ['principal', 'section_head', 'teacher' , 'student']; // Option 2
  String _selectedStudent; // Option 2

  
  @override
  Widget build(BuildContext context) {

      Widget buildEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter marks',
          style: TextStyle(
              color: Colors.white,
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
                  hintText: 'Enter mark',
                  hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0
                  ),
                  // prefixIcon: Icon(
                  //   Icons.email,
                  //   color: Colors.blue.shade500,
                  // )
              )
          ),
        )
      ],
    );
  }
  

     setState(() {
    teacher_name = widget.title.split("*")[0] ;
   subject_name = widget.title.split("*")[1] ;
   class_name = widget.title.split("*")[2];
   studentUserName = widget.title.split("*")[3];
 });
              if(k==0){
    AnouncementviewRequest3().then(( result){
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements3 =result;
           });
         k=1;
    });
}

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
                            Colors.blue.shade300,
                            Colors.blue.shade900,

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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                            SizedBox(height: 10,),
                            Text(setofAnnouncements3[0].studentUserName ,                           style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),),
                            SizedBox(height: 10,),
                          //  Text("Date uploaded :" + "2020/4/1 - 6.55 a.m"),
                            SizedBox(height: 10,),
                            Text("Answer :" ,                           style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),),
                            SizedBox(height: 10,),
                            Text(setofAnnouncements3[0].submission_text ,                           style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),),
                            SizedBox(height: 10,),
                        SizedBox(height: 20,),
                            SizedBox(height: 10,),
                            buildEmail(),
                            SizedBox(height: 10,),
                      
                   //     fullname(),                       
                    //subclass(),
                        buildLoginBtn(),
                  
                        Text(
                          _status,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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




































 

