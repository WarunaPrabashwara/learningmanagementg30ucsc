import 'package:frontend/main.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class mark_attendance extends StatefulWidget {
  mark_attendance({Key key, this.title}) : super(key: key);
  final String title;
  State<StatefulWidget> createState() => new _mark_attendanceState();
}

// ignore: camel_case_types
class _mark_attendanceState extends State<mark_attendance> {
  DateTime selectedDate = DateTime.now();


  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _status = '';
  int _absentPresent = 2;
  int id = 1;
  List<int> _selectedRadioIndexList = [];


  final List<Map<String, String>> listOfColumns = [
    {'Name': 'BBBBBB' ,'id': '1'},
    {'Name': 'CCCCCC' , 'id': '2' }
  ];

   List<Map<String, String>> absentPresent = [
    {'BBBBBB': ''   },
    {'CCCCCC': ''  }
  ];

   int i = 0 ;



  //  List<String> _locations = ['Please choose a location', 'A', 'B', 'C', 'D']; // Option 1
//  String _selectedLocation = 'Please choose a location'; // Option 1

  List<String> _years = ['A', 'BC', 'B','C', 'D']; // Option 2
  String _selectedYear; // Option 2

  List<String> _subjects = ['ALL'] + ['A', 'B', 'C', 'D']; // Option 2
  String _selectedSubject; // Option 2

  List<String> _classes = ['ALL'] + ['A', 'B',  'D']; // Option 2
  String _selectedClass; // Option 2

  @override
  Widget build(BuildContext context) {
    final SelectDateDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2.0,
          ),
          RaisedButton(
            onPressed: () => _selectDate(context), // Refer step 3
            child: Text(
              'Select',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            color: Colors.greenAccent,
          ),
        ],
      )
    );

    final SelectSubjectDropdown = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.cyanAccent,
      child: DropdownButton(
        hint: Text('select' ,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)), // Not necessary for Option 1
        value: _selectedSubject,
        onChanged: (newValue) {
          setState(() {
            _selectedSubject = newValue;
          });
        },
        items: _subjects.map((location) {
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

    final Select = Material(
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
        child: Text('Select',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );


    final mark = Material(
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
        child: Text('Submit',
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
                                  SizedBox(height: 70.0,
                                    child :Text('Date' ,
                                        style: style.copyWith(
                                            color: Colors.blue, fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 40.0,
                                    child :Text('subject' ,
                                        style: style.copyWith(
                                            color: Colors.blue, fontWeight: FontWeight.bold)),
                                  ),

                                  SizedBox(height: 40.0,
                                    child :Text('class' ,
                                        style: style.copyWith(
                                            color: Colors.blue, fontWeight: FontWeight.bold)),
                                  ),

                                ],
                              ) ,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 70.0,
                                   // width: 200,
                                    //width: 400,
                                    child:SelectDateDropdown ,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    //width: 400,
                                    child:SelectSubjectDropdown ,
                                  ),


                                  SizedBox(
                                    height: 40.0,
                                    //width: 400,
                                    child:SelectClassDropdown ,
                                  ),


                                ],
                              ) ,
                            ],
                          ),
                          SizedBox(
                            height: 40.0,
                            //width: 400,
                            child:Select ,
                          ),
                          SizedBox(height: 10.0),
                          Text('${this._status}',),


                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(

                              columns: [
                                DataColumn(label: Text('Present/Absent')),
                                DataColumn(label: Text('Name')),
                              ],
                              rows:
                              listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                                  .map(
                                ((element) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                        SizedBox (child:
                                        Row(
                                        children : [
                                          Radio(
                                            value: 1,
                                            groupValue: element["Name"],
                                            onChanged: (val) {
                                              setState(() {
                                                //radioButtonItem = 'ONE';
                                                _absentPresent = 1;
                                              });
                                            },
                                          ),
                                          Radio(
                                            value: 0,
                                            groupValue: _absentPresent,
                                            onChanged: (val) {
                                              setState(() {
                                                //radioButtonItem = 'TWO';
                                                _absentPresent = 0;
                                              });
                                            },
                                          ),
                                        ]
                                    ))),
                                    DataCell(Text(element["Name"])), //Extracting from Map element the value
                                  ],
                                )),
                              )
                                  .toList(),
                            ),
                          )
                          ,
                          mark,
                        ],
                      )
                  )
              )
          )

      ),
    );
  }
}
