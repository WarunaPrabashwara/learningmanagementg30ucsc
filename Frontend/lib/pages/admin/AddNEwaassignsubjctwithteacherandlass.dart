import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class addnewassignedsubjectss extends StatefulWidget {
  //const loginScreen({Key? key}) : super(key: key);

  @override
  _logiState createState() => _logiState();
}

class usersmodel {

  int id;
  String name;
  String email;
  String userLevel ;
  String indexNo;
  String telephone;
  String address;
  String dob ;

  usersmodel(this.id, this.name, this.email  ,this.userLevel ,this.indexNo, this.telephone, this.address  ,this.dob );

  usersmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userLevel = json['userLevel'];
        indexNo = json['indexNo'];
    telephone = json['telephone'];
    address = json['address'];
    dob = json['dob'];
    
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email ,
        'userLevel': userLevel,
              'indexNo': indexNo,
      'telephone': telephone,
      'address': address ,
        'dob': dob,
    };
  }
}

class subject {

  String name;
  String category;
  String allowed_classes;

  subject(this.name, this.category ,this.allowed_classes );

  subject.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    category = json['category'];
    allowed_classes = json['allowed_classes'];

    
  }

  Map<String, dynamic> toJson() {
    return {

      'name': name,
      'category': category ,
      'allowed_classes': allowed_classes,

    };
  }
}

class classes {

  int id;
  String section;
  String grade;

  classes(this.id, this.section ,this.grade );

  classes.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    section = json['section'];
    grade = json['grade'];

    
  }

  Map<String, dynamic> toJson() {
    return {

      'id': id,
      'section': section ,
      'grade': grade,

    };
  }
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


class _logiState extends State<addnewassignedsubjectss> {
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    String _value = "";
   // List<String> _students = ['admin'] + ['principal', 'section_head', 'teacher' , 'student']; // Option 2
  String selectedeacher; // Option 2
    int i =0;
    List<usersmodel> setofAnnouncements5 = [];
        int j =0;
    List<subject> setofAnnouncements6 = [];
            int k =0;
    List<classes> setofAnnouncements7 = [];
  bool isRememberMe = false;
  static const urlPrefix = 'http://10.0.2.2:2222';
    String subject_name ;
  String teacher_name;
  String class_name  ;
  int isHomeworkAvailFlag = 0  ;
  String zoom_link  ;



   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  
  Future<void> loginPostRequest(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/addnewAasignedSubject');

     await getTokenFromSF().then(( token) async {

    final headers = {  'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

    final json = '{"teacher_name": "${teacher_name}", "class_name": "${class_name}" , "subject_name": "${subject_name}", "isHomeworkAvailFlag": "${isHomeworkAvailFlag}",  "zoom_link": "${zoom_link}"   }';
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


  Future<List<usersmodel>> AnouncementviewRequest5(  ) async {
    final url = Uri.parse('$urlPrefix/user/viewTeachers');
    List<usersmodel> snapshot = await getTokenFromSF().then(( token) async {
    //  print('anment: ${token}');
   //   print('userse: ${token}');
      //  final headers = {"Content-type": "application/json "};
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

      // final json = '{"email": "${email}", "password": "${password}" }';
      //  print('user: ${json}');
      final response = await get(url, headers: headers );
    //  print('ususeusr: ${response.body}');
      final List t = json.decode(response.body);
      final List<usersmodel> anouncement =
      t.map((item) => usersmodel.fromJson(item)).toList();
     // respAnnouncement anouncement = respAnnouncement.fromJson(jsonDecode(response.body));
    //  print('user: ${anouncement[0].date_time}');
    //  print('Status code: ${response.statusCode}');
   //   print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
   // print('Stde: ${snapshot}');
    return snapshot ;
  }

  Future<List<subject>> AnouncementviewRequest6(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/viewSubs');
    List<subject> snapshot = await getTokenFromSF().then(( token) async {
    //  print('anment: ${token}');
   //   print('userse: ${token}');
      //  final headers = {"Content-type": "application/json "};
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

      // final json = '{"email": "${email}", "password": "${password}" }';
      //  print('user: ${json}');
      final response = await get(url, headers: headers );
    //  print('ususeusr: ${response.body}');
      final List tm = json.decode(response.body);
      final List<subject> anouncement =
      tm.map((item) => subject.fromJson(item)).toList();
     // respAnnouncement anouncement = respAnnouncement.fromJson(jsonDecode(response.body));
    //  print('user: ${anouncement[0].date_time}');
    //  print('Status code: ${response.statusCode}');
   //   print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
   // print('Stde: ${snapshot}');
    return snapshot ;
  }

  Future<List<classes>> AnouncementviewRequest7(  ) async {
    final url = Uri.parse('$urlPrefix/classmanagement/view');
    List<classes> snapshot = await getTokenFromSF().then(( token) async {
    //  print('anment: ${token}');
   //   print('userse: ${token}');
      //  final headers = {"Content-type": "application/json "};
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

      // final json = '{"email": "${email}", "password": "${password}" }';
      //  print('user: ${json}');
      final response = await get(url, headers: headers );
    //  print('ususeusr: ${response.body}');
      final List t = json.decode(response.body);
      final List<classes> anouncement =
      t.map((item) => classes.fromJson(item)).toList();
     // respAnnouncement anouncement = respAnnouncement.fromJson(jsonDecode(response.body));
    //  print('user: ${anouncement[0].date_time}');
    //  print('Status code: ${response.statusCode}');
   //   print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
   // print('Stde: ${snapshot}');
    return snapshot ;
  }

  String _status = '';


  Widget buildLoginBtn(){
    return Container(
      padding: EdgeInsets.fromLTRB(100.0, 15.0, 100.0, 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: (){
         // setState(() => this._status = 'loading');
          loginPostRequest();

          Timer(Duration(seconds :3), (){
                  setState(() {
              
                      this._value = "" ;
                       this.teacher_name = null ;
                       this.class_name  = null ;
                       this.isHomeworkAvailFlag = 0;
                       this.zoom_link = "" ;
                     
                       print("gggf");
                   
                         Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return addnewassignedsubjectss();
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
          'Create the Combnation',
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

                  if(i==0){
    AnouncementviewRequest5().then(( result){
       print("hghfnb") ;
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements5 =result;
           });
         i=1;
    });
}

                  if(j==0){
    AnouncementviewRequest6().then(( result){
       print("hghfnb") ;
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements6 =result;
           });
         j=1;
    });
}

                  if(k==0){
    AnouncementviewRequest7().then(( result){
       print("hghfnb") ;
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements7 =result;
           });
         j=1;
    });
}

    final SelectStudentDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select Teacher' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: teacher_name,
        onChanged: (newValue) {
          setState(() {
            teacher_name = newValue;
          });
        },
        items: setofAnnouncements5.map((location) {
          return DropdownMenuItem(
            child: new Text(location.name ,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            value: location.name,
          );
        }).toList(),
      ),
    );

    final SelectSubjjectDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select Subject' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: subject_name,
        onChanged: (newValue) {
          setState(() {
            subject_name = newValue;
          });
        },
        items: setofAnnouncements6.map((location) {
          return DropdownMenuItem(
            child: new Text(location.name ,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            value: location.name,
          );
        }).toList(),
      ),
    );

    final SelectClassDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select Class' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: class_name,
        onChanged: (newValue) {
          setState(() {
            class_name = newValue;
          });
        },
        items: setofAnnouncements7.map((location) {
          return DropdownMenuItem(
            child: new Text(location.section + "-" + location.grade ,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            value: location.section + "-" + location.grade,
          );
        }).toList(),
      ),
    );



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

                        SizedBox(height: 20,),
 
                          SelectStudentDropdown ,
                   SizedBox(height: 20,),
                      SelectSubjjectDropdown ,
                   SizedBox(height: 20,),
                      SelectClassDropdown ,

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
