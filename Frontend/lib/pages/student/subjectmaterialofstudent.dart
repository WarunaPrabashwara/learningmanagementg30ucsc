import 'dart:convert';
import 'dart:math';

import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/student/uploadhomework.dart';
import 'package:frontend/pages/teacher/mark_homework.dart';
import 'package:frontend/pages/teacher/marking_attendance.dart';
import 'package:frontend/pages/teacher/upload_test_test_mark.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';



// ignore: camel_case_types
class subject_Matirials_ofStudent extends StatefulWidget {
    final String title;
  const subject_Matirials_ofStudent(this.title);
 // subject_Matirials_ofTeacher(String subject, {Key key, this.title}) : super(key: key);

  State<StatefulWidget> createState() => new _subject_Matirials_ofTeacherState();
}


class mysubjects {
 
  String teacher_name;
  String class_name;
  String subject_name;
  int isHomeworkAvailFlag; 
  String zoom_link; 
  mysubjects(this.teacher_name, this.class_name, this.subject_name ,this.isHomeworkAvailFlag, this.zoom_link );

  mysubjects.fromJson(Map<String, dynamic> json) {
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
      'subject_name': subject_name,
      'isHomeworkAvailFlag': isHomeworkAvailFlag,      
      'zoom_link': zoom_link 

    };
  }
}

class materials {
 
  String teacher_name;
  String class_name;
  String subject_name;
    String material; 
  materials(this.teacher_name, this.class_name, this.subject_name , this.material );

  materials.fromJson(Map<String, dynamic> json) {
    teacher_name = json['teacher_name'];
    class_name = json['class_name'];
    subject_name = json['subject_name'];
    material = json['material'];
    
  }

  Map<String, dynamic> toJson() {
    return {
      'teacher_name': teacher_name,
      'class_name': class_name,
      'subject_name': subject_name,  
      'material': material 

    };
  }
}


// ignore: camel_case_types
class _subject_Matirials_ofTeacherState extends State<subject_Matirials_ofStudent> {

      int i =0;
      int j = 0;
  static const urlPrefix = 'http://10.0.2.2:2222';
  List<mysubjects> setofAnnouncements = [];
    List<materials> setofAnnouncements2 = [];
     getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  
  Future<List<mysubjects>> AnouncementviewRequest(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/studentseezoomlink?class_name='+ class_name +'&teacher_name=' + teacher_name + '&subject_name='+ subject_name);
    List<mysubjects> snapshot = await getTokenFromSF().then(( token) async {
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
      print('usus55sr: ${response.body}');
      final List t = json.decode(response.body);
      final List<mysubjects> anouncement =
      t.map((item) => mysubjects.fromJson(item)).toList();
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
 
  Future<List<materials>> AnouncementviewRequest2(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/viewsubjectmaterialstudent?class_name='+ class_name +'&teacher_name=' + teacher_name + '&subject_name='+ subject_name);
    List<materials> snapshot = await getTokenFromSF().then(( token) async {
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
      final List<materials> anouncement =
      t.map((item) => materials.fromJson(item)).toList();
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

  
    Future<void> loginPostRequest(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/addzoomlink');

     await getTokenFromSF().then(( token) async {

    final headers = {  'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

    final json = '{"teacher_name": "${teacher_name}", "class_name": "${class_name}" , "subject_name": "${subject_name}",  "zoom_link": "${email}"   }';
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

    });

  }

    Future<void> loginPostRequest2(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/addsubjectmaterial');

     await getTokenFromSF().then(( token) async {

    final headers = {  'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

    final json = '{"teacher_name": "${teacher_name}", "class_name": "${class_name}" , "subject_name": "${subject_name}",  "material": "${subject_material}"   }';
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

    });

  }



  //List<String> list = ["Science 7 A", "Maths 7 A", "Maths 7 B", "Maths 7 C"];
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  List<String> list = ["matirial1ggggggggggggggggggggggggggggggg", "matirial2", "matirial3"];
  List<String> list2 = ["kamal's", "nimal's", "amal's"];
  //TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';

  String email ;
String teacher_name ;
String subject_name ;
String class_name;
String subject_material;
  void _changeemail(String text) {
    setState(() {
      email = text;
    });
  }
    void _changeemail2(String text) {
    setState(() {
      subject_material = text;
    });
  }
  Widget buildEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

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
                  hintText: 'Enter Zoom link',
                  hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0
                  ),
    
              )
          ),
        )
   ,
              Align(
                alignment: Alignment.center,
                child:                                  TextButton(
                                onPressed: (){
                                            loginPostRequest();


                  setState(() {
          
                       print("gggf");
             
                         Navigator.pop(context  );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return subject_Matirials_ofStudent(   widget.title);
                          }),
                        );

                       });
      
                                },
                                child: Text("Add".toUpperCase(),          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
          ),),
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

              )
   
      ],
    );
  }
  
  Widget buildEmail2(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

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
                _changeemail2(text);
              },

              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.black87
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  hintText: 'Enter Material link',
                  hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0
                  ),
    
              )
          ),
        )
   ,
              Align(
                alignment: Alignment.center,
                child:                                  TextButton(
                                onPressed: (){
                                            loginPostRequest2();


                  setState(() {
          
                       print("gggf");
             
                         Navigator.pop(context  );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return subject_Matirials_ofStudent(   widget.title);
                          }),
                        );

                       });
      
                                },
                                child: Text("Add new material".toUpperCase(),          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
          ),),
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

              )
   
      ],
    );
  }
  
  String get subject => subject;
  @override
  Widget build(BuildContext context) {
 print("hhg")  ;
 print(widget.title.split("*"))  ;
 setState(() {
    teacher_name = widget.title.split("*")[0] ;
   subject_name = widget.title.split("*")[1] ;
   class_name = widget.title.split("*")[2];
 });
  print("hdsdshg" )  ;
 // print(widget.title.split('*'));

              if(i==0){
    AnouncementviewRequest().then(( result){
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements =result;
           });
         i=1;
    });
}
              if(j==0){
    AnouncementviewRequest2().then(( result){
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements2 =result;
           });
         j=1;
    });
}
    final MarkAttendanceButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return mark_attendance();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Mark Atendance',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final UploadTermTestMarksButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return upload_term_test_marks();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Upload Term Test Marks',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final DeleteHWButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(


        onPressed: () {
          setState(() => this._status = 'loading');
          
          
            if (setofAnnouncements == [] ||  setofAnnouncements[0].isHomeworkAvailFlag == 0) {
                    setState(() => this._status = 'You dont have any Homeworks');
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                         return uploadhwandseeResult(widget.title);
                }),
              );             
            
            }
     
        },
        child: Text('Upload Homework / See result of homework',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );



    final maerial = Material(
      child:
                               Container(
                              height: 120,
                              child: 
                              ListView.builder(
          //  padding: const EdgeInsets.all(8),
            itemCount: setofAnnouncements2.length,
 
            itemBuilder: (BuildContext context, int index) {
       
              return Container(
              height: 50,
                child: Column(
                  children: <Widget>[
                                                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
                          child: Center(
                            child: Text(
                              '${setofAnnouncements2[index].material}' ,
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
                     ),
                      ],
                    ),



                  ]
                ),
              );
 
         
           }
        ),
                            ) ,

    );




    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(""),
        // ),
        body:  new SingleChildScrollView(
            child: new Center(
                child: new Container(
                  //  color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            

                            SizedBox(height: 10,),
                            Text("Materials"          , style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
          ),),
                            SizedBox(height: 10,),
                            maerial,
                            SizedBox(height: 10,),
                          //  AddnewMatirialButon,
                            SizedBox(height: 10,),
                            Text("Zoom link" ,           style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
          ),),
                            SizedBox(height: 10,),
                            Container(
                              height: 120,
                              child: 
                              ListView.builder(
          //  padding: const EdgeInsets.all(8),
            itemCount: setofAnnouncements.length,
 
            itemBuilder: (BuildContext context, int index) {
                                return Container(
              height: 50,
                child: Column(
                  children: <Widget>[
                                                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
                          child: Center(
                            child: Text(
                              '${setofAnnouncements[index].zoom_link}' ,
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
                                child: Text("edit".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                child: Text("delete".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                           ],
                          ),
                        ),
                      ],
                    ),



                  ]
                ),
              );
           }
        ),
                            ) ,

                           // MarkAttendanceButon,

                            SizedBox(height: 10,),
                            DeleteHWButton,
                            SizedBox(height: 10,),
                        //          Text(
                        //   _status,
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 17.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),



                          ],
                        )
                    )
                )
            )

        ),
      ),
    );
  }
}
