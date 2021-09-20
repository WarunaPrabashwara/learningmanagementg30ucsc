import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/admin/adduser.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class viewuserspage extends StatefulWidget {


  @override
  _UserMgtState createState() => _UserMgtState();
}

class respAnnouncement {
  int id;
  String name;
  String email;
  String userLevel;
  String indexNo;
  String telephone;
  String address;
  String dob ; 
  respAnnouncement(this.id, this.name, this.email ,this.userLevel, this.indexNo, this.telephone,this.address, this.dob ); //constructor

  respAnnouncement.fromJson(Map<String, dynamic> json) {
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
      'telephone': telephone ,
      'address': address,
      'dob': dob

    };
  }
}


class _UserMgtState extends State<viewuserspage> {
  int i =0;
  static const urlPrefix = 'http://10.0.2.2:2222';
  List<respAnnouncement> setofAnnouncements1 = [];
  List<respAnnouncement> setofAnnouncements2 = [];
  List<respAnnouncement> setofAnnouncements3 = [];
  List<respAnnouncement> setofAnnouncements4 = [];
  List<respAnnouncement> setofAnnouncements5 = [];
   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  
  Future<List<respAnnouncement>> AnouncementviewRequest1(  ) async {  //connect to backend
    final url = Uri.parse('$urlPrefix/user/viewStudents');
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

  Future<List<respAnnouncement>> AnouncementviewRequest2(  ) async {  //connect to backend
    final url = Uri.parse('$urlPrefix/user/viewTeachers');
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

  Future<List<respAnnouncement>> AnouncementviewRequest3(  ) async {  //connect to backend
    final url = Uri.parse('$urlPrefix/user/viewPrincipal');
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

  Future<List<respAnnouncement>> AnouncementviewRequest4(  ) async {  //connect to backend
    final url = Uri.parse('$urlPrefix/user/viewSectionHead');
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

  Future<List<respAnnouncement>> AnouncementviewRequest5(  ) async {  //connect to backend
    final url = Uri.parse('$urlPrefix/user/viewAdmin');
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



  



  @override
  Widget build(BuildContext context) {
              if(i==0){

    AnouncementviewRequest1().then(( result){
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements1 =result;
           });
         i=1;
    });
    AnouncementviewRequest2().then(( result){
      //   print('anouncement: ${result[0].made_by}');
      setState(() {
        setofAnnouncements2 =result;
      });
      i=1;
    });
    AnouncementviewRequest3().then(( result){
      //   print('anouncement: ${result[0].made_by}');
      setState(() {
        setofAnnouncements3 =result;
      });
      i=1;
    });
    AnouncementviewRequest4().then(( result){
      //   print('anouncement: ${result[0].made_by}');
      setState(() {
        setofAnnouncements4 =result;
      });
      i=1;
    });
    AnouncementviewRequest5().then(( result){
      //   print('anouncement: ${result[0].made_by}');
      setState(() {
        setofAnnouncements5 =result;
      });
      i=1;
    });
}
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        //backgroundColor: decor,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
                "User Management".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  //backgroundColor: Colors.blue,
                  letterSpacing: 1.5,
                  height: 4.0
                ),),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: Text(
          //     "User Management".toUpperCase(),
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 18.0,
          //         fontWeight: FontWeight.bold
          //     ),
          //
          //   ),
          //
          // ),
          flexibleSpace: Image.asset(
            "assets/df3.png",
            fit: BoxFit.cover,
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_walk, color: Colors.white,), text: 'Students',),
              Tab(icon: Icon(Icons.people_alt), text: 'Teachers',),
              Tab(icon: Icon(Icons.people_alt), text: 'Principals',),
              Tab(icon: Icon(Icons.people_alt), text: 'Section-Heads',),
              Tab(icon: Icon(Icons.perm_data_setting_sharp), text: 'Admins',),
            ],
          ),
          elevation: 12.0,
        ),
        body:  TabBarView(
          children: [

            ListView.builder(
              //  padding: const EdgeInsets.all(8),
                itemCount: setofAnnouncements1.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(height: 0.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Colors.blue.shade400,
                          ),

                          //height: 50,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 58.0, 8.0),
                            child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                      SizedBox(height: 0.0,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Name: ${setofAnnouncements1[index].name}' ,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.0,

                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    SizedBox(height: 5.0,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'E-mail : ${setofAnnouncements1[index].email}' ,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0,

                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                  SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: (){},
                                        child: Text("View".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                        child: Text("Edit".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                      ElevatedButton(
                                        onPressed: (){},
                                        child: Text("DELETE".toUpperCase(), style: TextStyle(fontSize: 10),),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: Colors.white)
                                                )
                                            )
                                        ),
                                      ),
                                    ],
                                  ),



                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
            ),

            ListView.builder(
              //  padding: const EdgeInsets.all(8),
                itemCount: setofAnnouncements2.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(height: 0.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Colors.blue.shade400,
                          ),

                          //height: 50,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 58.0, 8.0),
                            child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  SizedBox(height: 0.0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Name: ${setofAnnouncements2[index].name}' ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,

                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'E-mail : ${setofAnnouncements2[index].email}' ,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17.0,

                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: (){},
                                        child: Text("View".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                        child: Text("Edit".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                      ElevatedButton(
                                        onPressed: (){},
                                        child: Text("DELETE".toUpperCase(), style: TextStyle(fontSize: 10),),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: Colors.white)
                                                )
                                            )
                                        ),
                                      ),
                                    ],
                                  ),



                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
            ),

            ListView.builder(
              //  padding: const EdgeInsets.all(8),
                itemCount: setofAnnouncements3.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(height: 0.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Colors.blue.shade400,
                          ),

                          //height: 50,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 58.0, 8.0),
                            child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  SizedBox(height: 0.0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Name: ${setofAnnouncements3[index].name}' ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,

                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'E-mail : ${setofAnnouncements3[index].email}' ,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17.0,

                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: (){},
                                        child: Text("View".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                        child: Text("Edit".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                      ElevatedButton(
                                        onPressed: (){},
                                        child: Text("DELETE".toUpperCase(), style: TextStyle(fontSize: 10),),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: Colors.white)
                                                )
                                            )
                                        ),
                                      ),
                                    ],
                                  ),



                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
            ),

            ListView.builder(
              //  padding: const EdgeInsets.all(8),
                itemCount: setofAnnouncements4.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(height: 0.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Colors.blue.shade400,
                          ),

                          //height: 50,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 58.0, 8.0),
                            child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  SizedBox(height: 0.0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Name: ${setofAnnouncements4[index].name}' ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,

                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'E-mail : ${setofAnnouncements4[index].email}' ,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17.0,

                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: (){},
                                        child: Text("View".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                        child: Text("Edit".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                      ElevatedButton(
                                        onPressed: (){},
                                        child: Text("DELETE".toUpperCase(), style: TextStyle(fontSize: 10),),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: Colors.white)
                                                )
                                            )
                                        ),
                                      ),
                                    ],
                                  ),



                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
            ),

            ListView.builder(
              //  padding: const EdgeInsets.all(8),
                itemCount: setofAnnouncements5.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(height: 0.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Colors.blue.shade400,
                          ),

                          //height: 50,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 58.0, 8.0),
                            child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  SizedBox(height: 0.0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Name: ${setofAnnouncements5[index].name}' ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,

                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'E-mail : ${setofAnnouncements5[index].email}' ,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17.0,

                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: (){},
                                        child: Text("View".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                        child: Text("Edit".toUpperCase(), style: TextStyle(fontSize: 10, color: Colors.black,),),
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
                                      ElevatedButton(
                                        onPressed: (){},
                                        child: Text("DELETE".toUpperCase(), style: TextStyle(fontSize: 10),),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: Colors.white)
                                                )
                                            )
                                        ),
                                      ),
                                    ],
                                  ),



                                ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
            ),
          ],
        ),



      ),
    );
  }
}

