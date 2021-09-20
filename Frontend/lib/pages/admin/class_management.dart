import 'package:flutter/material.dart';
import 'package:frontend/pages/admin/addnewclass.dart';
import 'package:frontend/pages/admin/viewclasses.dart';

class ClzMgt extends StatefulWidget {


  @override
  _ClzMgtState createState() => _ClzMgtState();
}

class _ClzMgtState extends State<ClzMgt> {

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        flexibleSpace: Image.asset(
          "assets/df3.png",
          fit: BoxFit.cover,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Container(),
        ),
        title:
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Class Management".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              height: 3.0,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade500,
                    Colors.blue.shade300,
                    Colors.blue.shade200,
                    Colors.blue.shade100,
                  ]
              )
          ),
          //padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                child: Center(
                  child: Text(
                    "Classes",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),




                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: (){
                                              Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return viewclasses();
                          }),
                        );
                    },
                    child: Text("view".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                //side: BorderSide(color: Colors.black)
                            )
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: ( ){
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return addnewclass();
                          }),
                        );
                    },
                    child: Text("add new".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                //side: BorderSide(color: Colors.black)
                            )
                        )
                    ),
                  ),
                ),


            ]
        ),
      )
    ),
    ),
    );
  }
}