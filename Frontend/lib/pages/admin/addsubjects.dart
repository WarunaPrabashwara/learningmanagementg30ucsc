import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class addsubject extends StatefulWidget {
  //const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class respAnnouncement {

  int id;
  String section;
  String grade;
  List<bool> array =[ false ] ;
  respAnnouncement(this.id, this.section, this.grade  );

  respAnnouncement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    section = json['section'];
    grade = json['grade'];

    
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'section': section,
      'grade': grade 

    };
  }
}

class respAnnouncement2 {
  int id;
  String name;
  List<bool> array = [ false ] ;
  respAnnouncement2(this.id, this.name );

  respAnnouncement2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
   
    
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
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


class _loginScreenState extends State<addsubject> {
    int i =0;
    List<respAnnouncement> setofAnnouncements = [];
        int j =0;
    List<respAnnouncement2> setofAnnouncements2 = [];
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
   
  bool isRememberMe = false;
  static const urlPrefix = 'http://10.0.2.2:2222';

  String fulname = "" ;
  String  category ;
  String allowed_classes  = "" ;
  List<int> array1 ;


  void _fulname(String text) {
    setState(() {
      fulname = text;
    });
  }
  
  void _username(String text) {
    setState(() {
      for( int i in array1){
        print( "hooo" + "($array1(i))");
      }
      allowed_classes = text;
    });
  }

  
   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  Future<void> loginPostRequest(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/upload');
  // for( respAnnouncement i in setofAnnouncements ){
  //   print(setofAnnouncements) ;

  // }
  print("aa");
 print(setofAnnouncements[0].array[0]) ;
  for( int i = 0 ; i < setofAnnouncements.length ; i++ ){
    print(setofAnnouncements[i].array[0] );
    if( setofAnnouncements[i].array[0] == true ){
      setState(() {
          allowed_classes = allowed_classes + " " + setofAnnouncements[i].section ;
      });
        
    }
 };
print("a");
 print(setofAnnouncements2[0].array[0] );
 for( int i = 0 ; i < setofAnnouncements2.length ; i++ ){
    print(setofAnnouncements2[i].array[0] );
    if(setofAnnouncements2[i].array[0] == true ){
        setState(() {
        category = setofAnnouncements2[i].name ;
        });
    }
    
 };
 print("aaa");
     await getTokenFromSF().then(( token) async {

    final headers = {  'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

     final json = '{"name": "${fulname}", "category": "${category}" , "allowed_classes": "${allowed_classes}"  }';
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


  Future<List<respAnnouncement>> AnouncementviewRequest(  ) async {
    final url = Uri.parse('$urlPrefix/classmanagement/view');
    List<respAnnouncement> snapshot = await getTokenFromSF().then(( token) async {
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
      final List<respAnnouncement> anouncement =
      t.map((item) => respAnnouncement.fromJson(item)).toList();
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

  Future<List<respAnnouncement2>> AnouncementviewRequest2(  ) async {
    final url = Uri.parse('$urlPrefix/subjectmanagement/viewSubCategory');
    List<respAnnouncement2> snapshot = await getTokenFromSF().then(( token) async {
  //    print('anment: ${token}');
  //    print('userse: ${token}');
      //  final headers = {"Content-type": "application/json "};
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

      // final json = '{"email": "${email}", "password": "${password}" }';
      //  print('user: ${json}');
      final response = await get(url, headers: headers );
  //    print('ususeusr: ${response.body}');
      final List t = json.decode(response.body);
      final List<respAnnouncement2> anouncement =
      t.map((item) => respAnnouncement2.fromJson(item)).toList();
     // respAnnouncement anouncement = respAnnouncement.fromJson(jsonDecode(response.body));
    //  print('user: ${anouncement[0].date_time}');
//      print('Status code: ${response.statusCode}');
//      print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
 //   print('Stde: ${snapshot}');
    return snapshot ;
  }

  

  String _status = '';
  Widget fullname(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '',
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
                      
                       this.fulname = "";
      
                     //  print("gggf");
                    //   print(dob);
                         Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return addsubject();
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
          'Add Subject',
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

    final SelectStudentDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select user level' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: _selectedStudent,
        onChanged: (newValue) {
          setState(() {
            _selectedStudent = newValue;
          });
        },
        items: _students.map((location) {
          return DropdownMenuItem(
            child: new Text(location ,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            value: location,
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
 
                Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                  child: Center(
                    child: Text(
                      "Enter subject name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


                        fullname(),
                       
                        
                Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                  child: Center(
                    child: Text(
                      "Grades allowed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

             Container(
               height: 180,
               child: ListView.builder(
                shrinkWrap: true,
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
                                '${setofAnnouncements[index].section}' ,
                             style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 5,),
                               SizedBox(width: 5,),
                                Checkbox(
                                value: setofAnnouncements[index].array[0],
                                 onChanged: (bool value) {
                                setState(() {
                                  setofAnnouncements[index].array[0] = value ;
                                
                                });
                                    },
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
                     ),
             )
                      ,
                 Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                  child: Center(
                    child: Text(
                      "Select the subject catogery",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

             Container(
               height: 130,
               child: ListView.builder(
                shrinkWrap: true,
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
                                '${setofAnnouncements2[index].name}' ,
                           style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 5,),
                               SizedBox(width: 5,),
                                Checkbox(
                                value: setofAnnouncements2[index].array[0],
                                 onChanged: (bool value) {
                                setState(() {
                                  setofAnnouncements2[index].array[0] = value ;
                               
                                });
                                    },
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
                     ),
             )
                      ,
                       
       
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
