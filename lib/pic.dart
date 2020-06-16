import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rend/globals.dart';
import 'package:http_parser/http_parser.dart';

class UploadImageDemo extends StatefulWidget {
  UploadImageDemo() : super();

  final String title = "Upload Image Demo";

  @override
  UploadImageDemoState createState() => UploadImageDemoState();
}

class UploadImageDemoState extends State<UploadImageDemo> {
  //
  static final String uploadEndPoint = 'http://176.58.113.106/api/upload/';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  TextStyle sty = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  chooseImage2() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path;
    upload(fileName);
  }

  upload(String fileName)   async {
    Map body = {
      "image": base64Image,
      "name": fileName,
    };
    // var b = json.encode(body);
    // http.post(uploadEndPoint, body: b).then((result) {
    //   setStatus(result.statusCode == 200 ? result.body : errMessage);
    // }).catchError((error) {
    //   setStatus(error);
    // });
    var b = json.encode(body);
    final response = await post(uploadEndPoint,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
        print("again");
    if (response.statusCode == 200) {
      var res = response.body;
       setStatus(res);
      final json = jsonDecode(response.body);
      print(json);
      return res;
    } else {
      print(response.body);
      throw Exception('error connecting');
    }
  }

  
  Future<String> uploadImage(filename) async {
    print(filename);
    var url = uploadEndPoint;
    Map<String, String> headers = {
      "Accesstoken": Globals.token,
      "enctype": "multipart/form-data"
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields['user'] = 'blah';
    request.files.add(await http.MultipartFile.fromPath('picture', filename,
        contentType: new MediaType('image', 'jpeg')));
    var response = await request.send();
    print(request.files);
    print(response.reasonPhrase);
    if (response.statusCode == 200) print('Uploaded!');
    return response.reasonPhrase;
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          print("tempfile $tmpFile");
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
            style:TextStyle(fontFamily: 'Montserrat', fontSize: 20.0 ,color:Colors.black54)
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
            style:TextStyle(fontFamily: 'Montserrat', fontSize: 20.0 ,color:Colors.black54)
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlineButton(
              onPressed: chooseImage,
              child: Text('Select Image from  Gallary',style:TextStyle(fontFamily: 'Montserrat', fontSize: 20.0 ,color:Colors.black54)),
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: chooseImage2,
              child: Text('Choose Image from Camera',style:TextStyle(fontFamily: 'Montserrat', fontSize: 20.0 ,color:Colors.black54)),
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: startUpload,
              child: Text('Upload Image',style:TextStyle(fontFamily: 'Montserrat', fontSize: 20.0 ,color:Colors.black54)),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
