import 'package:flutter/cupertino.dart';
import 'package:frontend/main.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class mark_homework extends StatefulWidget {
  mark_homework( {Key key, this.title}) : super(key: key);
  final String title;
  State<StatefulWidget> createState() => new _mark_homeworkState();
}

// ignore: camel_case_types
class _mark_homeworkState extends State<mark_homework> {
  List<String> list = ["matirial1ggggggggggggggggggggggggggggggg", "matirial2", "matirial3"];
  List<String> list2 = ["kamal's", "nimal's", "amal's"];
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';

  String get subject => subject;
  @override
  Widget build(BuildContext context) {


    final downloadButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(


        onPressed: () {
          setState(() => this._status = 'loading');

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  //        return MyProfile();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Download',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final SubmitButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(


        onPressed: () {
          setState(() => this._status = 'loading');

          appAuth.login().then((result) {
            if (result) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  //        return MyProfile();
                }),
              );
              //Navigator.of(context).pushNamed('/teacher/my_profile');
              //Navigator.of(context).pushReplacementNamed('/teacher/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Submit',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final EnterMark = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Mark",
         // border:
          //OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
    );



    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body:  new SingleChildScrollView(
            child: new Center(
                child: new Container(
                  //  color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 10,),
                            Text("Name of the student :" + "waruna"),
                            SizedBox(height: 10,),
                            Text("Date uploaded :" + "2020/4/1 - 6.55 a.m"),
                            SizedBox(height: 10,),
                            Text("Answer :" + " \n " +"hugest walll in te world is so hugest walll in te world is so coohugest walll in te world is so coohugest walll in te world is so coocool and"),
                            SizedBox(height: 10,),
                            Text("Attchement :" + "available"),
                            SizedBox(height: 10,),
                            downloadButton,
                            SizedBox(height: 10,),
                            EnterMark,
                            SizedBox(height: 10,),
                            SubmitButton,
                            SizedBox(height: 10.0),



                          ],
                        )
                    )
                )
            )

        ),
      ),
    );
  }
}
