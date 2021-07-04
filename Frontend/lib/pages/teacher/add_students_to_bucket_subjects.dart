import 'package:frontend/main.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class students_to_bucket_subjects extends StatefulWidget {
  students_to_bucket_subjects({Key key, this.title}) : super(key: key);
  final String title;
  State<StatefulWidget> createState() => new _students_to_bucket_subjectsState();
}

// ignore: camel_case_types
class _students_to_bucket_subjectsState extends State<students_to_bucket_subjects> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';

  final List<Map<String, String>> listOfColumns = [
    {"Name": "AANmbdfdfde", "Number": "1", "State": "YerAAmberAAAANumberAAAAANumberAAAus"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "AANmu", "Number": "1", "State": "Yes"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "AA", "Number": "1", "State": "Yes"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
  ];

  List listOfSubjects = [
    {"Name": ["bin 1"], "subjects": ["sin" , "tam" ,"eng" ,"eng"]},
    {"Name": ["bin 2"], "subjects": ["sin0" , "tam3" ,"eng"]},
    {"Name": ["bin 3"], "subjects": ["sin" , "tam" ,"eng"]},


  ];
  List<String> _binsubjects = ['bin1', 'bin2', 'bin3'];
  List<String> _bin1 = ['bin1', 'bin2', 'bin3'];
  List<String> _bin2 = ['bin1', 'bin2', 'bin3'];
  List<String> _bins3 = ['bin1', 'bin2', 'bin3'];
  List<String> k ;
  List   binsubjectset2 = [
    ["sin" , "tam" ,"eng" ,"eng"] ,
    ["sin0" ,  "tam3" , "eng"],
    ["sin" , "tam" ,"eng"],
  ];
  List statesList;
  String _selectedBin ;
  //  List<String> _locations = ['Please choose a location', 'A', 'B', 'C', 'D']; // Option 1
//  String _selectedLocation = 'Please choose a location'; // Option 1


  List<String> _years = ['A', 'BC', 'B','C', 'D']; // Option 2
  String _selectedYear; // Option 2

  List<String> _terms = ['A', 'B', 'C', 'DC', 'D']; // Option 2
  String _selectedTerm; // Option 2

  List<String> _subjects = ['ALL'] + ['A', 'B', 'C', 'D']; // Option 2
  String _selectedSubject; // Option 2

  List<String> _sections = ['A',  'C', 'D']; // Option 2
  String _selectedSection; // Option 2

  List<String> _classes = ['ALL'] + ['A', 'B',  'D']; // Option 2
  String _selectedClass; // Option 2

  List<String> _students = ['ALL'] + ['A', 'B', 'C']; // Option 2
  String _selectedStudent; // Option 2

  @override
  Widget build(BuildContext context) {


    final bintypescreator = Material(
      child: Column(
        children: _binsubjects.asMap().entries.map((locat) {
          int idx = locat.key;
          String location = locat.value;
          return Row(
            children : [
              Text(location),
              DropdownButton(
                  hint: Text('select' ,
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                  value: _selectedSection,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedBin = newValue;
                    });
                  },

                  items: _bin2.map((location2) {

                    return new DropdownMenuItem(
                      child: new Text(location2 ,
                          style: style.copyWith(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                      value: location2,
                    );
                  }).toList(),
              ),


            ]
          );

        }).toList(),


      ),


    );

    final SelectSectionDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: _selectedSection,
        onChanged: (newValue) {
          setState(() {
            _selectedSection = newValue;
          });
        },
        items: _sections.map((location) {
          return DropdownMenuItem(
            child: new Text(location ,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            value: location,
          );
        }).toList(),
      ),
    );

    final SelectClassDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: _selectedClass,
        onChanged: (newValue) {
          setState(() {
            _selectedClass = newValue;
          });
        },
        items: _classes.map((location) {
          return DropdownMenuItem(
            child: new Text(location ,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            value: location,
          );
        }).toList(),
      ),
    );

    final SelectStudentDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: _selectedStudent,
        onChanged: (newValue) {
          setState(() {
            _selectedStudent = newValue;
          });
        },
        items: _students.map((location) {
          return DropdownMenuItem(
            child: new Text(location ,
                style: style.copyWith(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            value: location,
          );
        }).toList(),
      ),
    );

    final Submit = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.greenAccent,
      child: MaterialButton(
        //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() => this._status = 'loading');

          appAuth.login().then((result) {
            if (result) {
              setState(() => this._status = '');
              // Navigator.of(context).pushNamed('/teacher/student_to_bucket_sub');

            } else {
              setState(() => this._status = 'something went wrong ! try again');
            }
          });
        },
        child: Text('Submit',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    final print = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.greenAccent,
      child: MaterialButton(
        //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          appAuth.login().then((result) {
            if (result) {//table is not empty
              // Navigator.of(context).pushNamed('/teacher/student_to_bucket_sub');
            } else {
              setState(() => this._status = 'Result Table is empty. nothing to print');
            }
          });
        },
        child: Text('Download Result sheet ',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    return  Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [

                                  SizedBox(height: 40.0,
                                    child :Text('section' ,
                                        style: style.copyWith(
                                            color: Colors.blue, fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 40.0,
                                    child :Text('class' ,
                                        style: style.copyWith(
                                            color: Colors.blue, fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 40.0,
                                    child :Text('Student' ,
                                        style: style.copyWith(
                                            color: Colors.blue, fontWeight: FontWeight.bold)),
                                  ),

                                ],
                              ) ,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 40.0,
                                    //width: 400,
                                    child:SelectSectionDropdown ,
                                  ),

                                  SizedBox(
                                    height: 40.0,
                                    //width: 400,
                                    child:SelectClassDropdown ,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    //width: 400,
                                    child:SelectStudentDropdown ,
                                  ),


                                ],
                              ) ,
                            ],
                          ),
                          SizedBox(
                            height: 40.0,
                            //width: 400,
                            child:Submit ,
                          ),
                          SizedBox(height: 10.0),
                          Text('${this._status}',),
                          bintypescreator,
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )
                  )
              )
          )

      ),
    );
  }


}
