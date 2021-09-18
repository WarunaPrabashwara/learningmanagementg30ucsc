
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/admin/adduser.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentList extends StatefulWidget {


  @override
  _UserMgtState createState() => _UserMgtState();
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




class _UserMgtState extends State<StudentList> {
      int i =0;
    List<usersmodel> setofAnnouncements5 = [];

    Future<List<usersmodel>> AnouncementviewRequest5(  ) async {
    final url = Uri.parse('$urlPrefix/user/viewStudents');
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

  static const urlPrefix = 'http://10.0.2.2:2222';

   getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
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
    AnouncementviewRequest5().then(( result){
       print("hghfnb") ;
   //   print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements5 =result;
           });
         i=1;
    });
}
    return Scaffold(
      //backgroundColor: decor,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.shade800,
      //   title:
      //   Padding(
      //     padding: const EdgeInsets.all(18.0),
      //     child: Text(
      //       "User Management".toUpperCase(),
      //       style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 18.0,
      //           fontWeight: FontWeight.bold
      //       ),
      //     ),
      //   ),
      // ),
      body:   ListView.builder(
          //  padding: const EdgeInsets.all(8),
            itemCount: setofAnnouncements5.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //height: 50,
                child: Column(
                  children: <Widget>[
                                                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                                            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 0.0,),
                    Container(
                      child: SizedBox(
                        width: 380.0,
                        height: 100.0,
                        child: Card(
                          color: Color.fromARGB(200, 20, 21, 21),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text("Name : ", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0
                                      ),
                                      ),
                                      Text('${setofAnnouncements5[index].name}', style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0
                                      ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width : 25.0),

               
                                  Row(
                                    children: [
                                      Text("Telephone : ", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0
                                      ),
                                      ),
                                      Text( '${setofAnnouncements5[index].telephone}' , style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0
                                      ),
                                      ),
                                    ],
                                  ),
 
                                                                   Row(
                                    children: [
                                      Text("Address : ", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0
                                      ),
                                      ),
                                      Text( '${setofAnnouncements5[index].address}' , style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0
                                      ),
                                      ),
                                    ],
                                  ),
  
                                ],
                              ),
                            ),
                        ),
                      ),
                    ),
                 ],
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
