import 'package:flutter/material.dart';

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
        title:
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Class Management".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
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
                    Colors.blue.shade300,
                    Colors.blue.shade900,

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


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 15.0, 5.0, 15.0),
                    child: Center(
                      child: Text(
                        "6 - A",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Text("Edit".toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black,),),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0)),
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
                          child: Text("DELETE".toUpperCase(), style: TextStyle(fontSize: 12),),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0)),
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


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 15.0, 5.0, 15.0),
                    child: Center(
                      child: Text(
                        "7 - A",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Text("Edit".toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black,),),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0)),
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
                          child: Text("DELETE".toUpperCase(), style: TextStyle(fontSize: 12),),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0)),
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

              Padding(
                padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 22.0),
                child: Center(
                  child: Text(
                    "Add New Classes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 15.0, 5.0, 15.0),
                    child: Center(
                      child: Text(
                        "select Grade",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(

                    padding: const EdgeInsets.only(right: 50.0),
                    child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text("Grade 6"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Grade 7"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                              child: Text("Grade 8"),
                              value: 3
                          ),
                          DropdownMenuItem(
                              child: Text("Grade 9"),
                              value: 4
                          ),
                          DropdownMenuItem(
                            child: Text("Grade 10"),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            child: Text("Grade 11"),
                            value: 6,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),

                ],
              ),


              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 30.0, 5.0, 15.0),
                    child: Center(
                      child: Text(
                        "select Sub Class",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(

                    padding: const EdgeInsets.only(right: 50.0),
                    child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text("Class A"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Class B"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                              child: Text("Class C"),
                              value: 3
                          ),
                          DropdownMenuItem(
                              child: Text("Class D"),
                              value: 4
                          ),
                          DropdownMenuItem(
                            child: Text("Class E"),
                            value: 5,
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),

                ],
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: ElevatedButton(
                  onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                     // return AddNewclass();
                    }),
                  );},
                  child: Text("Add New Class".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
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
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: ElevatedButton(
                  onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      // return Deleteclass();
                    }),
                  );},
                  child: Text("Delete Class".toUpperCase(), style: TextStyle(fontSize: 14, fontWeight:FontWeight.w900),),
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