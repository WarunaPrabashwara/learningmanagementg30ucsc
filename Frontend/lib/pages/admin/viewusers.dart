import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
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
  respAnnouncement(this.id, this.name, this.email ,this.userLevel, this.indexNo, this.telephone,this.address, this.dob );

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
  List<respAnnouncement> setofAnnouncements = [];
   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  
  Future<List<respAnnouncement>> AnouncementviewRequest(  ) async {
    final url = Uri.parse('$urlPrefix/user/viewusers');
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
      padding: EdgeInsets.fromLTRB(120.0, 10.0, 120.0, 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return adduser();
              }),
            );
        },
        padding: EdgeInsets.all(7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: Text(
          'Add a user',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 16,
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
        backgroundColor: Colors.blue.shade800,
        title:
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "User Management".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body:   ListView.builder(
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
                              '${setofAnnouncements[index].email}' ,
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
                        ),
                      ],
                    ),



                  ]
                ),
              );
            }
        )
   
 ,
            

   
    );
  }
}
