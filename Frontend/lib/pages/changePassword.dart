import 'dart:convert';

import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class changepassword extends StatefulWidget {
  changepassword({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  static const urlPrefix = 'http://10.0.2.2:2222';
  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  Future<int> pwdchangeRequest(  ) async {

    final url = Uri.parse('$urlPrefix/user/changepswd');
    var snapshot = await getTokenFromSF().then(( token) async {
      final headers = {        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',};

      final json = '{"oldpassword": "${oldpassword}", "newpassword": "${newpassword}" }';
      print('user: ${json}');
      final response = await put(url, headers: headers, body: json);
      print('usyyyyer: ${response.body}');
      print('Sus code: ${response.statusCode}');
   //   resp user = resp.fromJson(jsonDecode(response.body));
      //    print('user: ${user.status}');
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
      //final message = MessageGet(response);
      return response.statusCode ;


    });
    print('snapshot: ${snapshot}');
    //   print('snapshot: ${snapshot.body}');
    return snapshot ;

  }

  String oldpassword  ;
  String newpassword  ;
  String newpassword2  ;
  void _changeoldpassword(String text) {
    setState(() {
      oldpassword = text;
    });
  }
  void _newpassword(String text) {
    setState(() {
      newpassword = text;
    });
  }
  void _newpassword2(String text) {
    setState(() {
      newpassword2 = text;
    });
  }
  @override
  Widget build(BuildContext context) {

    final oldpassword = TextField(
      onChanged: (text) {
        _changeoldpassword(text);
      },

      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter old password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final newpassword = TextField(
      onChanged: (text) {
        _newpassword(text);
      },

      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter new password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final newpasswordAgain = TextField(
      onChanged: (text) {
        _newpassword2(text);
      },

      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter new password again",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final ChangeButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple.shade500,
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if(this.newpassword == this.newpassword2){
            setState(() => this._status = 'loading');
            pwdchangeRequest().then(( result){

              if (result == 200) {
                setState(() => this._status = 'password changed ');
              } else {
                setState(() => this._status = 'Something went wrong ,Try again');
              }
            });

          }
          else{
            setState(() => this._status = 'new passwords are not matching');
          }



        },
        child: Text('Submit',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(

      appBar: new AppBar(
        title: new Text("Change Password".toUpperCase(),style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            height:2.0
        ),),
          backgroundColor: Colors.purple.shade500
        // leading: new IconButton(
        //  icon: new Icon(Icons.arrow_back_ios),
       //    onPressed: () => //Navigator.popAndPushNamed(context, '/changePassword');
       //   Navigator.of(context).pop()
     //   ),
      ),
      body: new SingleChildScrollView(
          child: new Center(
              child: new Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 246, 246, 246),
                            Color.fromARGB(255, 246, 246, 246),
                            Colors.white,
                            Colors.purple.shade50,
                            Colors.purple.shade100,
                            // Colors.blue.shade400,
                          ]
                      )
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 155.0,
                          ),
                          SizedBox(height: 45.0),
                          oldpassword,
                          SizedBox(height: 25.0),
                          newpassword,
                          SizedBox(
                            height: 35.0,
                          ),
                          newpasswordAgain,
                          SizedBox( height: 15.0, ),
                          ChangeButton,
                          SizedBox( height: 15.0, ),
                          Text('${this._status}',),
                          SizedBox(
                              height: 25
                          ),


                        ],
                      )
                  )
              )
          )

      ),

    );
  }
}
