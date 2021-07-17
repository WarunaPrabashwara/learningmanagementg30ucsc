import 'package:frontend/main.dart';
import 'package:flutter/material.dart';
import 'grade_six_subjects.dart';

class PrincipalSubjectList extends StatefulWidget {
  PrincipalSubjectList({Key key, this.title}) : super(key: key);
  @override
  final String title;
  State<StatefulWidget> createState() => new _PrincipalSubjectListState();
}

class _PrincipalSubjectListState extends State<PrincipalSubjectList> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  @override
  Widget build(BuildContext context){

    final GradeSixSubjectsButon = Material(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                 // return GradeSixSubjects();
                }),
              );
              //Navigator.of(context).pushNamed('/principal/my_profile');
              //Navigator.of(context).pushReplacementNamed('/principal/my_profile');
            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Grade 6 Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final GradeSevenSubjectsButon = Material(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                 // return GradeSevenSubjects();
                }),
              );            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Grade 7 Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final GradeEightSubjectsButon = Material(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                 // return GradeEightSubjects();
                }),
              );            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Grade 8 Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final GradeNineSubjectsButon = Material(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                 // return GradeNineSubjects();
                }),
              );            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Grade 9 Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final GradeTenSubjectsButon = Material(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                //  return GradeTenSubjects();
                }),
              );            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Grade 10 Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final GradeElevenSubjectsButon = Material(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
               //   return GradeElevenSubjects();
                }),
              );            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Grade 11 Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final GradeTwelveSubjectsButon = Material(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  //return GradeTwelveSubjects();
                }),
              );            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Grade 12 Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final GradeThirteenSubjectsButon = Material(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  //return GradeThirteenSubjectsButon();
                }),
              );            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Grade 13 Subjects',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return  Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
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
                            height: 15.0,
                          ),
                          SizedBox(height: 45.0),
                          GradeSixSubjectsButon,
                          SizedBox(height: 45.0),
                          GradeSevenSubjectsButon,
                          SizedBox(height: 45.0),
                          GradeEightSubjectsButon,
                          SizedBox(height: 45.0),
                          GradeNineSubjectsButon,
                          SizedBox(height: 45.0),
                          GradeTenSubjectsButon,
                          SizedBox(height: 45.0),
                          GradeElevenSubjectsButon,
                          SizedBox(height: 45.0),
                          GradeTwelveSubjectsButon,
                          SizedBox(height: 45.0),
                          GradeThirteenSubjectsButon,

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
