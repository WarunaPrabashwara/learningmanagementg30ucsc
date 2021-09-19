import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class creategroups extends StatefulWidget {
  //const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
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


class _loginScreenState extends State<creategroups> {
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    String _value = "";
     int i =0;
     String selectedclass ;
    List<classes> setofAnnouncements5 = [];
  bool isRememberMe = false;
  static const urlPrefix = 'http://10.0.2.2:2222';

  String section ;
  String grade  ;


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
  Future<void> loginPostRequest(  ) async {
    final url = Uri.parse('$urlPrefix/groups/upload');

     await getTokenFromSF().then(( token) async {

    final headers = {  'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

    final json = '{"section": "${selectedclass}" ,"grade": "${grade}"  }';
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

  Future<List<classes>> AnouncementviewRequest5(  ) async {
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


  Widget subclass(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter Group name',
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
          loginPostRequest();

          Timer(Duration(seconds :3), (){
                  setState(() {
                
                       this.section = "";
                  
                       print("gggf");
                    //   print(dob);
                         Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return creategroups();
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



   

    final SelectsectionDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select Class' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: selectedclass,
        onChanged: (newValue) {
          setState(() {
            selectedclass = newValue;
          });
        },
        items: setofAnnouncements5.map((location) {
          return DropdownMenuItem(
            child: new Text(location.section + " - " + location.grade ,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            value: location.section + " - " + location.grade ,
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

                      SelectsectionDropdown ,

                               SizedBox(height: 20,),
             subclass(),
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
