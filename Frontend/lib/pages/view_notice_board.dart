import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'changePassword.dart';
import 'package:http/http.dart' ;


class view_notice_board extends StatefulWidget {
  State<StatefulWidget> createState() => new _view_notice_boardState();
}
class respAnnouncement {
  String date_time;
  String description;
  String made_by;
  respAnnouncement(this.date_time, this.description, this.made_by);

  respAnnouncement.fromJson(Map<String, dynamic> json) {
    date_time = json['date_time'];
    description = json['description'];
    made_by = json['made_by'];
  }

  Map<String, dynamic> toJson() {
    return {
      'date_time': date_time,
      'description': description,
      'made_by': made_by
    };
  }
}

class _view_notice_boardState extends State<view_notice_board> {
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
      print('user: ${anouncement[0].date_time}');
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
    AnouncementviewRequest().then(( result){
      print('anouncement: ${result[0].made_by}');
          setState(() {
            setofAnnouncements =result;
           });
         i=1;
    });
}


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade500 ,
          title: Text('Notice Board'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              height: 3.0
          ),),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20.0),
            child: Container(),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    //Color.fromARGB(255, 246, 246, 246),
                    //Color.fromARGB(255, 246, 246, 246),
                    Colors.white,
                    Colors.purple.shade50,
                    Colors.purple.shade100,
                  ]
              )
          ),
          child: ListView.builder(

              padding: const EdgeInsets.all(8),
              itemCount: setofAnnouncements.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  //height: 50,

                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 380.0,
                          height: 140.0,
                          child: Card(
                            color: Colors.purpleAccent.shade100,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [

                                      Padding(
                                        padding: EdgeInsets.fromLTRB(30.0, 20.0, 20.0, 0.0),
                                        child: AutoSizeText('${setofAnnouncements[index].date_time}',
                                            style: TextStyle(fontSize: 16.0,
                                                color: Colors.purple.shade900,
                                                fontStyle: FontStyle.italic)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 0.0),
                                    child: Text(
                                      '${setofAnnouncements[index].description} ',
                                      style: TextStyle(fontSize: 20.0,
                                          color: Colors.purple.shade900,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 0.0),
                                    child: AutoSizeText("-"+'${setofAnnouncements[index].made_by} ',
                                        style: TextStyle(fontSize: 17.0,
                                            color: Colors.purple.shade900,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                    ]
                  ),
                );
              }
          ),
        )
   
   
    );
  }
}










