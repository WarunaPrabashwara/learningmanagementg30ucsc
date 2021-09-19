import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' ;
import '../main.dart';
class loginScreen extends StatefulWidget {
  //const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
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
class _loginScreenState extends State<loginScreen> {
  bool isRememberMe = true;
  static const urlPrefix = 'http://10.0.2.2:2222';

  String email ;
  String password  ;
  void _changeemail(String text) {
    setState(() {
      email = text;
    });
  }
  void _changepswd(String text) {
    setState(() {
      password = text;
    });
  }
  addTokenToSF(String token , String email , String  userLevel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('email', email);
    prefs.setString('userLevel', userLevel);
    print('login/add tok fu: ${token}');
  }
  addTokenToSF2(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email', email);

  }
  Future<resp> loginPostRequest(  ) async {
    final url = Uri.parse('$urlPrefix/user/login');

    final headers = {"Content-type": "application/json"};

    final json = '{"email": "${email}", "password": "${password}" }';
    print('user login details : ${json}');
    final response = await post(url, headers: headers, body: json);
    print('response body: ${response.body}');

    resp user = resp.fromJson(jsonDecode(response.body));
    print('user: ${user.message}');
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}'); //body also has things above two
    //final message = MessageGet(response);
    return user ;
  }
  /* String MessageGet(response){
    var decodedJson = json.decode(response);
    print(decodedJson);
    var message = json.decode(decodedJson['message']).toString();
    print(message);
    return message ;
  }*/

  String _status = 'Your are logged out';
  Widget buildEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'User Email',
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
                  hintText: 'Enter your Email address',
                  hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue.shade500,
                  )
              )
          ),
        )
      ],
    );
  }
  Widget buildPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
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
                _changepswd(text);
              },

              obscureText: true,
              style: TextStyle(
                  color: Colors.black87
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue.shade700,
                  )
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
            print("testing - login pressed noted");
          loginPostRequest().then(( result) {
                 print("Post req ok!");
            print(result);
            if (result.message == "successfully authenticated" ) {
              addTokenToSF(result.token , this.email , result.userLevel);
              addTokenToSF2( this.email);
              print('on click button: ${result.token}');
              if(result.userLevel == "teacher"){
                Navigator.of(context).pushReplacementNamed('/teacher/home');
              }
              else if (result.userLevel == "student"){
                Navigator.of(context).pushReplacementNamed('/student/home');
              }
              else if (result.userLevel == "section_head"){
                Navigator.of(context).pushReplacementNamed('/section_head/home');
              }
              else if (result.userLevel == "admin"){
                Navigator.of(context).pushReplacementNamed('/admin/home');
              }
              else if (result.userLevel == "principal"){
                Navigator.of(context).pushReplacementNamed('/principal/home');
              }
              else{
                print('invalid');
              }


            } else {
              setState(() => this._status = 'Username or password Incorrect');
              //setState(() => this._status = 'rejected');
            }
          });
        },
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget buildSignUpButn(){
    return GestureDetector(
      onTap: ()=>print('Sign Up Pressed'),
      child: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                text: 'Need any help? ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                  text: 'Click here!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )
              )
            ]
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
                        Column(
                          children: [
                            SizedBox(height: 40,),
                            Image.asset("assets/education.png", width: 58.0,),
                            SizedBox(height: 10.0),
                            Text("නැණ පියස", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0
                            ),textAlign: TextAlign.center,),
                          ],
                        ),

                        SizedBox(height: 20,),
                        Text('Log In', style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 90,),
                        buildEmail(),
                        SizedBox(height: 20,),
                        buildPassword(),
                        SizedBox(height: 20,),
                        buildLoginBtn(),
                        buildSignUpButn(),
                        SizedBox(height: 20,),
                        Text(_status)
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
