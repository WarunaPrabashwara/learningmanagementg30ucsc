import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ttofteacher extends StatefulWidget {
//  String phoneNumber;
//  UserInfoEdit({@required this.phoneNumber});
// Go back to previous page
  @override
  _UserInfoEditState createState() => _UserInfoEditState();
}

class _UserInfoEditState extends State<ttofteacher> {
  getTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenValue = prefs.getString('token');
    return tokenValue;
  }


   Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String error = 'Error';

  chooseImage() {
    setState(() {
      file =  ImagePicker.pickImage(source: ImageSource.gallery);
      
    });
    setStatus('');
  }


  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  uploadImg() {
    if (null == tmpFile) {
      setStatus(error);
      return;
    }

    String fileName = tmpFile.path.split('/').last;

    upload(fileName , tmpFile);
  }

  Future<String> upload(String fileName , File file) async {
   print("respoCode");

      await getTokenFromSF().then(( token) async {
                    var request = new http.MultipartRequest(
      "POST", Uri.parse('hhttp://10.0.2.2:2222/timetable/upload'));
                 print("response.statusCode");
            request.headers['Accept'] = 'application/json';
            request.headers['Content-Type'] = 'multipart/form-data';
            request.headers['Authorization'] = 'Bearer $token';
            request.headers['emailofStudentorTeacher'] = 'My first image';
            request.files.add(await http.MultipartFile.fromPath('image', file.path));
         print("resode");
        request.send().then((response) {
             print("rhhhhhe");
        http.Response.fromStream(response).then((onValue) {
          print("wwwwhe");
          try {
            print(response.statusCode);
          } catch (e) {
            print("error"); 
          }
       });
  });
            });
return "a" ;
    //     var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    //   var length = await file.length();
    //   var uri = Uri.parse('hhttp://10.0.2.2:2222/timetable/upload');
    //  var request = new http.MultipartRequest("POST", uri);
    //   var multipartFile = new http.MultipartFile('image', stream, length,
    //       filename: basename(file.path));
    //       //contentType: new MediaType('image', 'png'));
    //   request.files.add(multipartFile);
    //   await getTokenFromSF().then(( token) async {
    //     request.headers["Authorization"] = token ;
    //      request.fields["email"] = "aaaa";
    //      var response = await request.send();
    //         print(response.statusCode);
    //     response.stream.transform(utf8.decoder).listen((value) {
    //       print(value);
    //   }); 
    //    }) ;



    // final url = Uri.parse('hhttp://10.0.2.2:2222/timetable/upload');
    // String snapshot = await getTokenFromSF().then(( token) async {
    // //  var stream = new http.ByteStream(DelegatingStream.typed());
    //   var request = http.MultipartRequest(
    //     "POST" , url 
    //   );
    //   request.headers["Authorization"] = token ;
    //   request.fields["email"] = "aa";
    //   var ext = fileName ;
    //   var pic = new http.MultipartFile.fromBytes(field, value);
    //   request.files.add(pic);
    //   await request.send().then((response) async {
    //       response.stream.transform(utf8.decoder).listen((value) { 
    //         print(value);
    //       });
    //   } );



     // var responseData = await response.stream.toBytes();
     // var responseString = String.fromCharCode(responseData);
     // var d = jsonDecode(responseString);
     // print(response ); 



    //   final headers = {        'Content-Type': 'multipart/form-data',
    //     'Accept': 'application/json',
    //     'Authorization': 'Bearer $token',};
    //   final body = {
    //     "image": base64Image,
    //     "email": fileName,
    //   } ;
    //   final response = await http.post(url, headers: headers , body : body );
    //   print('usyyyyer: ${response.body}');
    //  // profiledata user = profiledata.fromJson(jsonDecode(response.body));

    //   print('Status code: ${response.statusCode}');
    //   print('Body: ${response.body}');
    //   //final message = MessageGet(response);
    //   return response ;
    // });
    // return snapshot ;

  }

 // print("RESPONSE ${snapshot.body}");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image/Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<File>(
              future: file,
              builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    null != snapshot.data) {
                  tmpFile = snapshot.data;
                  base64Image = base64Encode(snapshot.data.readAsBytesSync());
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Material(
                      elevation: 3.0,
                      child: Image.file(
                        snapshot.data,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                } else if (null != snapshot.error) {
                  return const Text(
                    'Error!',
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Material(
                      elevation: 3.0,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            child: Image.asset('./assets/placeholder-image.png'),
                         ),
                          InkWell(
                            onTap: () {
                              chooseImage();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, right: 10.0),
                              child: Icon(
                                Icons.edit,
                                size: 30.0,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              width: 360.0,
              child: RaisedButton(
                child: Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                color: Colors.blue,
                onPressed: () {
                  uploadImg();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
