import 'package:frontend/main.dart';
import 'package:flutter/material.dart';


class MyProfile extends StatefulWidget {
  MyProfile({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  String _name = 'waruna';
  String _index = '65464984';
  @override
  Widget build(BuildContext context){


    final ChangePasswordButon = Material(
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
              // Navigator.of(context).pushReplacementNamed('/changePassword');
              Navigator.of(context).pushNamed('/changePassword');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Change Password',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final LogoutButon = Material(
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
              Navigator.of(context).pushReplacementNamed('/login');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Logout',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );



    return  Scaffold(
      appBar: new AppBar(
        title: new Text("home"),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => //Navigator.popAndPushNamed(context, '/changePassword');
            Navigator.of(context).pop()
        ),
      ),
      body:  new SingleChildScrollView(
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
                            child: Image.asset(
                                "./assets/profile-pic.JPG"
                            ),
                          ),
                          Text("Name : ${this._name}"),
                          Text("Index : ${this._index}"),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(height: 45.0),
                          ChangePasswordButon,
                          SizedBox(height: 45.0),
                          LogoutButon,
                          SizedBox(height: 45.0),

                          Text('${this._status}',)

                        ],
                      )
                  )
              )
          )

      ),
    );
  }

}
