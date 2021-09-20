import 'dart:convert';

import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'changePassword.dart';

class profiledata {
  String email;
  String indexNo;
  String name;
  String telephone;
  String address;
  String dob;

  profiledata(this.email, this.indexNo, this.name, this.telephone, this.address, this.dob);

  factory profiledata.fromJson(dynamic json) {
    return profiledata(json['email'] as String, json['indexNo'] as String, json['name'] as String, json['telephone'] as String, json['address'] as String, json['dob'] as String);
  }
  @override
  String toString() {
    return '{ ${this.email}, ${this.indexNo}, ${this.name}, ${this.telephone}, ${this.address}, ${this.dob}}';
  }
}

class MyProfile extends StatefulWidget {
  MyProfile({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _MyProfileState();
}
class _MyProfileState extends State<MyProfile> {
  void _changename(String text) {
    setState(() {
      _name = text;
    });
  }
  void _changeindex(String text) {
    setState(() {
      _index = text;
    });
  }
  void _changenamef(String text) {
    setState(() {
      _funame = text;
    });
  }
  void _changephone(String text) {
    setState(() {
      _phone = text;
    });
  }
  void _changeaddre(String text) {
    setState(() {
      _address = text;
    });
  }


  void _changedob(String text) {
    setState(() {
      _dob = text;
    });
  }
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  static const urlPrefix = 'http://10.0.2.2:2222';
   int i =0;
  String _name = '';
  String _index = '';
  String _funame = '';
  String _phone = '';
  String _address = '';
  String _dob = '';
  addTokenToSF(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    print('login/add tok fu: ${token}');
  }
  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  Future<profiledata> profiledataRequest(  ) async {
    final url = Uri.parse('$urlPrefix/user/myprofile');
    profiledata snapshot = await getTokenFromSF().then(( token) async {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};
      final response = await get(url, headers: headers);
      print('usyyyyer: ${response.body}');
      profiledata user = profiledata.fromJson(jsonDecode(response.body)); //USER
      print('user: ${user.email}');
      //print('uservvvvvvvvvvvvvvvvv: ${response.}');
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
      //final message = MessageGet(response);
      return user ;


    });
    return snapshot ;
  }
  @override
  Widget build(BuildContext context){
  if(i==0){
    profiledataRequest().then(( result){
      print('anouncement: ${result.email}');

      _changename(result.email);
      _changeindex(result.indexNo);
      _changenamef(result.name);
      _changephone(result.telephone);
      _changeaddre(result.address);
      _changedob(result.dob);
      i=1;
    });
}

    return  Scaffold(
      appBar: new AppBar(
        title: Row(
          children: [
            SizedBox(width: 80,),
            Text("My Profile".toUpperCase()),
          ],
        ),
        backgroundColor: Colors.blue.shade800 ,
      ),
      body:  new SingleChildScrollView(
          child: new Center(
              child: new Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue.shade300,
                            Colors.blue.shade900,
                          ]
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      SizedBox(
                        height: 100.0,
                        child: Image.asset(
                          // "./assets/profile-pic.JPG"
                            './assets/pro2.png'
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[

                              Container(child: Text('User E-mail', style: TextStyle(color: Colors.blue.shade900, letterSpacing: 2.0,  fontSize:16.0,fontWeight: FontWeight.bold, ),)),

                              SizedBox(height: 1.0,),
                              Text('${this._name}', style: TextStyle(color: Colors.white, letterSpacing: 1.0, fontSize:16.0, ),),
                              SizedBox(height: 15,),

                              Text('Index', style: TextStyle(color: Colors.blue.shade900, letterSpacing: 2.0, fontSize:16.0, fontWeight: FontWeight.bold, ),),
                              // Divider(
                              //   height: 10.0,
                              //   color: Colors.black,
                              //   thickness: 1.0,
                              // ),
                              SizedBox(height: 1.0,),
                              Text('${this._index}', style: TextStyle(color: Colors.white, letterSpacing: 1.0, fontSize:16.0,),),
                              SizedBox(height: 15,),
                              Container(child: Text('Your Name', style: TextStyle(color: Colors.blue.shade900, letterSpacing: 2.0,  fontSize:16.0,fontWeight: FontWeight.bold, ),)),

                              SizedBox(height: 1.0,),
                              Text('${this._funame}', style: TextStyle(color: Colors.white, letterSpacing: 1.0, fontSize:16.0, ),),
                              SizedBox(height: 10,),
                              Container(child: Text('Contact Number', style: TextStyle(color: Colors.blue.shade900, letterSpacing: 2.0,  fontSize:16.0,fontWeight: FontWeight.bold, ),)),

                              SizedBox(height: 1.0,),
                              Text('${this._phone}', style: TextStyle(color: Colors.white, letterSpacing: 1.0, fontSize:16.0, ),),
                              SizedBox(height: 15,),
                              Container(child: Text('Permanent Address', style: TextStyle(color: Colors.blue.shade900, letterSpacing: 2.0,  fontSize:16.0,fontWeight: FontWeight.bold, ),)),

                              SizedBox(height: 1.0,),
                              Text('${this._address}', style: TextStyle(color: Colors.white, letterSpacing: 1.0, fontSize:16.0, ),),
                              SizedBox(height: 15,),
                              Container(child: Text('Date of Birth', style: TextStyle(color: Colors.blue.shade900, letterSpacing: 2.0,  fontSize:16.0,fontWeight: FontWeight.bold, ),)),

                              SizedBox(height: 1.0,),
                              Text('${this._dob}', style: TextStyle(color: Colors.white, letterSpacing: 1.0, fontSize:16.0, ),),


                              SizedBox(height: 15.0),
                              //ChangePasswordButon,
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                                width: double.infinity,
                                child: RaisedButton(
                                  elevation: 5,
                                  onPressed: () {
                                    setState(() => this._status = 'loading');

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return changepassword();
                                      }),
                                    );
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  color: Colors.blue.shade100,
                                  child: Text(
                                    'Change Password',
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              //LogoutButon,
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                                width: double.infinity,
                                child: RaisedButton(
                                  elevation: 5,
                                  onPressed: () {
                                    setState(() => this._status = 'loading');

                                    Navigator.of(context).pushReplacementNamed('/login');
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  color: Colors.blue.shade100,
                                  child: Text(
                                    'Log out',
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 45.0),

                              Text('${this._status}',),
                              SizedBox( height: 50,),



                            ],
                          )
                      ),
                    ],
                  )
              )
          )

      ),
    );
  }

}
