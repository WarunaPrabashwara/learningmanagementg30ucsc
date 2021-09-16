import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'changePassword.dart';
import 'package:http/http.dart' ;


class deleteMyAnouncements extends StatefulWidget {
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
class _view_notice_boardState extends State<deleteMyAnouncements> {
  static const urlPrefix = 'http://10.0.2.2:2222';
  List<respAnnouncement> setofAnnouncements = [];
  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }
  Future<List<respAnnouncement>> AnouncementviewRequest(  ) async {
    final url = Uri.parse('$urlPrefix/announcement/viewMyAnnouncement');
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
     // print('user: ${anouncement[0].date_time}');
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
      //final message = MessageGet(response);
      return anouncement ;
    });
    print('Stde: ${snapshot}');
    return snapshot ;
  }

    Future<void> deleteAnouncement( String description ) async {

      final url = Uri.parse('$urlPrefix/announcement/deleteAnounce');
     // final furi = url.replace(queryParameters: qparam);
        await getTokenFromSF().then(( token) async {
        print('anment: ${token}');
        print('userse: ${token}');
        //  final headers = {"Content-type": "application/json "};
        final headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',};
             final json = '{"id": "${description}" }';


        // final json = '{"email": "${email}", "password": "${password}" }';
        //  print('user: ${json}');
        final response = await delete(url , headers: headers , body: json  );
        print('usujhvjygsr: ${response.body}');

      // respAnnouncement anouncement = respAnnouncement.fromJson(jsonDecode(response.body));
      // print('user: ${anouncement[0].date_time}');
        print('Stam tus code: ${response.statusCode}');
        print('Boolokdy: ${response.body}');
        //final message = MessageGet(response);
  
      });
      //print('Stde: ${snapshot.}');
      
    }



  @override
  Widget build(BuildContext context) {
    AnouncementviewRequest().then(( result){
      print('anouncement: ${result[0].made_by}');
      setofAnnouncements =result;
    });
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Announcements'),
        ),
        body: ListView.builder(
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
                          color: Colors.grey[200],
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
                                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                                      child: AutoSizeText('${setofAnnouncements[index].date_time}',style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${setofAnnouncements[index].description} ',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:    Container(
                                      padding: EdgeInsets.fromLTRB(100.0, 15.0, 100.0, 10.0),
                                      width: double.infinity,
                                      child: RaisedButton(
                                        elevation: 5,
                                        onPressed: (){
                                           deleteAnouncement(setofAnnouncements[index].description);
                                           print("fsdfdfdf" +setofAnnouncements[index].description);
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return deleteMyAnouncements();
                                              }),
                                            );
                                            
        
                                        },
                                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        color: Colors.white,
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.blue.shade900,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
  
 
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
        )
    );
  }
}










