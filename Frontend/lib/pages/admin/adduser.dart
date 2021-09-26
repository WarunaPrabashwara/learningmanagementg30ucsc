import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class adduser extends StatefulWidget {
  //const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
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


class _loginScreenState extends State<adduser> {
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    String _value = "";
 
  bool isRememberMe = false;
  static const urlPrefix = 'http://10.0.2.2:2222';

  String fulname ;
  String index  ;
  String tpno ;
  String aaddress  ;
  String dob ;
  String usrnme  ;
  String firstloginpswd ;

  void _fulname(String text) {
    setState(() {
      fulname = text;
    });
  }
  void _index(String text) {
    setState(() {
      index = text;
    });
  }
  void _tpno(String text) {
    setState(() {
      tpno = text;
    });
  }
  void _address(String text) {
    setState(() {
      aaddress = text;
    });
  }
  void _dob(String text) {
    setState(() {
      dob = text;
    });
  }
  void _username(String text) {
    setState(() {
      usrnme = text;
    });
  }
  void _firstloginpswd(String text) {
    setState(() {
      firstloginpswd = text;
    });
  }
  
   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  Future<void> loginPostRequest(  ) async {
    final url = Uri.parse('$urlPrefix/user/register');

     await getTokenFromSF().then(( token) async {

    final headers = {  'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

    final json = '{"name": "${fulname}", "password": "${firstloginpswd}" , "email": "${usrnme}",  "userLevel": "${_selectedStudent}"  ,"indexNo": "${index}", "telephone": "${tpno}"  ,"address": "${aaddress}", "dob": "${dob}"  }';
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
  /* String MessageGet(response){
    var decodedJson = json.decode(response);
    print(decodedJson);
    var message = json.decode(decodedJson['message']).toString();
    print(message);
    return message ;
  }*/

  String _status = '';
  Widget fullname(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Full name',
          style: TextStyle(
              color: Colors.deepPurple.shade900,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
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
                    color: Colors.deepPurpleAccent,
                    blurRadius: 3,
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
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14, left: 20, bottom: 10),
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
  Widget indexno(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Index no',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 18,
              fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
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
                    color: Colors.deepPurpleAccent,
                    blurRadius: 3,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 50,
          child: TextField(
              onChanged: (text) {
                _index(text);
              },

            //  obscureText: true,
              style: TextStyle(
                  color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14, left: 20, bottom: 10),
               //   hintText: 'Enter your password',
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
  Widget tpnumber(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Telephone no',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 18,
              fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
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
                    color: Colors.deepPurpleAccent,
                    blurRadius: 3,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 50,
          child: TextField(
              onChanged: (text) {
                _tpno(text);
              },

              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14, left: 20, bottom: 10),
              //    hintText: 'Enter your user ID',
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
  Widget address(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Address',
          style: TextStyle(
              color: Colors.deepPurple.shade900,
              fontSize: 18,
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
                    color: Colors.deepPurpleAccent,
                    blurRadius: 3,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 50,
          child: TextField(
              onChanged: (text) {
                _address(text);
              },

              // obscureText: true,
              style: TextStyle(
                  color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14, left: 20, bottom: 10),
                 // hintText: 'Enter your password',
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
  Widget doBirth(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Date of birth',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 18,
              fontWeight: FontWeight.bold,letterSpacing: 0.5,
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
                    color: Colors.deepPurpleAccent,
                    blurRadius: 3,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 50,
          child: TextField(
              onChanged: (text) {
                _dob(text);
              },

              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14, left: 20, bottom: 10),
             //     hintText: 'Enter your user ID',
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
  Widget username(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 18,
              fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
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
                    color: Colors.deepPurpleAccent,
                    blurRadius: 3,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 50,
          child: TextField(
              onChanged: (text) {
                _username(text);
              },

         //     obscureText: true,
              style: TextStyle(
                  color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14, left: 20, bottom: 10),
                  //hintText: 'Enter your password',
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
  Widget firstloginpswdd(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'First Login password',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 18,
              fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
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
                    color: Colors.deepPurpleAccent,
                    blurRadius: 3,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 50,
          child: TextField(
              onChanged: (text) {
                _firstloginpswd(text);
              },

             // obscureText: true,
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14, left: 20, bottom: 10),
              //    hintText: 'Enter your password',
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
                      this._value = "" ;
                       this.fulname = "";
                       this.index  = "";
                       this.tpno = "";
                       this.aaddress = "" ;
                       this.dob = "" ;
                       this.usrnme = "" ;
                       this.firstloginpswd = "";
                       print("gggf");
                       print(dob);
                         Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return adduser();
                          }),
                        );

                       });
          });
   
        },
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.purple.shade900,
        child: Text(
          'Add user',
          style: TextStyle(
            color:  Colors.purple.shade50,
            fontSize: 20.0,
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

    final SelectStudentDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.purple.shade50,
      child: DropdownButton(

        hint: Text('select user level' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: _selectedStudent,
        onChanged: (newValue) {
          setState(() {
            _selectedStudent = newValue;
          });
        },
        items: _students.map((location) {
          return DropdownMenuItem(
            child: new Text(location ,
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold)),
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
                            //Color.fromARGB(255, 246, 246, 246),
                            //Color.fromARGB(255, 246, 246, 246),
                            Colors.purple.shade300,
                            Colors.purple.shade300,
                            //Colors.purple.shade50,
                            //Colors.purple.shade100,

                          ]
                      )
                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    //padding: EdgeInsets.symmetric(
                       // horizontal: 45,
                        //vertical: 40
                    //),
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        SizedBox(height: 20, width: 20,),
 
                          SelectStudentDropdown ,
                        SizedBox(height: 20, width: 20,),

                      
                        fullname(),
                        SizedBox(height: 20, width: 20,),
                       
                        indexno(),
                        SizedBox(height: 20, width: 20,),
                        
                        tpnumber(),
                        SizedBox(height: 20, width: 20,),
                     
                        address(),
                        SizedBox(height: 20, width: 20,),
                        
                        doBirth(),
                        SizedBox(height: 20, width: 20,),

                        username(),
                        SizedBox(height: 20, width: 20,),
                       
                        firstloginpswdd(),
                        SizedBox(height: 20, width: 20,),

                        buildLoginBtn(),
                        SizedBox(height: 20, width: 20,),
                  
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
