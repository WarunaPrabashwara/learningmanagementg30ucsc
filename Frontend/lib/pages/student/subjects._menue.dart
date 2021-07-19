import 'package:flutter/material.dart';
import 'subject.dart';

class Subjects extends StatelessWidget {
  //const Subjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subjects"),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            child: MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
              color: Colors.blue,
              minWidth: 300,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text("Subject 1"),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
              color: Colors.blue,
              minWidth: 300,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text("Subject 2"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
              color: Colors.blue,
              minWidth: 300,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text("Subject 3"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
              color: Colors.blue,
              minWidth: 300,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text("Subject 4"),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
              color: Colors.blue,
              minWidth: 300,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text("Subject 5"),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
              color: Colors.blue,
              minWidth: 300,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text("Subject 6"),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical : 8, horizontal: 30),
              color: Colors.blue,
              minWidth: 300,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Text("Subject 7"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Subject()));
              },
            ),
          ),
        ],
      ),
     )
    );
  }
}
