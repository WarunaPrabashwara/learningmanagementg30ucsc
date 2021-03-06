import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/admin/addstudentstogroups.dart';
import 'package:frontend/pages/admin/adduser.dart';
import 'package:frontend/pages/admin/creategroups.dart';
import 'package:frontend/pages/admin/viewusers.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserMgt extends StatefulWidget {


  @override
  _UserMgtState createState() => _UserMgtState();
}

class respAnnouncement {
  int id;
  String name;
  String email;
  String userLevel;
  String index;
  String telephone;
  String address;
  String dob ; 
  respAnnouncement(this.id, this.name, this.email ,this.userLevel, this.index, this.telephone,this.address, this.dob );

  respAnnouncement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userLevel = json['userLevel'];
    index = json['index'];
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
      'index': index,
      'telephone': telephone ,
      'address': address,
      'dob': dob

    };
  }
}


class _UserMgtState extends State<UserMgt> {
  int i =0;
  static const urlPrefix = 'http://10.0.2.2:2222';
  List<respAnnouncement> setofAnnouncements = [];
   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  
  Future<List<respAnnouncement>> AnouncementviewRequest(  ) async {
    final url = Uri.parse('$urlPrefix/announcement/view');
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
    //  print('user: ${anouncement[0].date_time}');
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
    print('Stde: ${snapshot}');
    return snapshot ;
  }

  
  Widget buildLoginBtn(){
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10,
        onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return adduser();
              }),
            );
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.purple,
        child: Text(
          'Add a user',
          style: TextStyle(
            color: Colors.purple.shade50,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget viewusers(){
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10,
        onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return viewuserspage();
              }),
            );
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.purple,
        child: Text(
          'View users',
          style: TextStyle(
            color: Colors.purple.shade50,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget createStudentGroups(){
    return Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10,
        onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return creategroups();
              }),
            );
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.purple,
        child: Text(
          'View Students and their classes',
          style: TextStyle(
            color: Colors.purple.shade50,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget addstudentstogroups(){
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10,
        onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return addstudentstoGroups();
              }),
            );
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.purple,
        child: Text(
          'Add students to Classes',
          style: TextStyle(
            color: Colors.purple.shade50,

            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


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
    return Scaffold(
      //backgroundColor: decor,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade500 ,

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(23.0),
          child: Container(),
        ),
        title:
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "User Management".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              height: 3.0,
            ),

          ),
        ),

      ),
      body: SafeArea(

        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [

                    Colors.blue.shade300,
                    Colors.blue.shade300,
                    Colors.blue.shade300,
                    Colors.blue.shade700,

                  Color.fromARGB(255, 246, 246, 246),
              Color.fromARGB(255, 246, 246, 246),
              Colors.white,
              Colors.purple.shade50,
              Colors.purple.shade100,

                  ]
              )
          ),
          //padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0,
                              offset: Offset(0,1)
                          )
                        ]
                    ),
                    height: 50,
                    child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            color: Colors.black87
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14,left: 25),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.purple.shade800,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.purple.shade600,
                          )
                        )
                    ),
                  ),
                ),

                buildLoginBtn(),
                 SizedBox(height: 15.0,),
                 viewusers(),
                 SizedBox(height: 15.0,),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                  child: Center(
                    child: Text(
                      "--------------------------------------------",
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


                 createStudentGroups(),
                 SizedBox(height: 15.0,),
                 addstudentstogroups(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
