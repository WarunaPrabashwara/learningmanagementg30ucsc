import 'package:frontend/main.dart';
import 'package:flutter/material.dart';


class changepassword extends StatefulWidget {
  changepassword({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';


  @override
  Widget build(BuildContext context) {

    final oldpassword = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter old password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final newpassword = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter new password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final newpasswordAgain = TextField(
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
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

          appAuth.login().then((result) {
            if (result) {
              Navigator.of(context).pushReplacementNamed('/teacher/home');
            } else {
              setState(() => this._status = 'Something went wrong ,Try again');
            }
          });
        },
        child: Text('Submit',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(

      appBar: new AppBar(
        title: new Text("data"),
       // leading: new IconButton(
        //  icon: new Icon(Icons.arrow_back_ios),
       //    onPressed: () => //Navigator.popAndPushNamed(context, '/changePassword');
       //   Navigator.of(context).pop()
     //   ),
      ),
      body: new SingleChildScrollView(
          child: new Center(
              child: new Container(
                  color: Colors.white,
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
