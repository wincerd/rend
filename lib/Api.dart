import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:alice/alice.dart';
import 'package:rend/user.dart';
import 'package:rend/globals.dart';
import 'package:rend/HttpRequest.dart';
class Api{
  static const String base_url = 'http://176.58.113.106/';
  static const String lgin = base_url + "api/login";
  static const String reg = base_url + 'api/user';
 Future  login(String user, String password) async {
    String targethost = '176.58.113.106';
  //  var gettokenuri = new Uri(scheme: 'http',
  //           host: targethost,
  //           path: '/api/login');
    Map body = {"username": user, "password": password};
    var b = json.encode(body);
    final response = await post(lgin,
        headers: {"Content-Type": "application/json"}, body: b);
    if (response.statusCode == 200) {
       var res  =response.body;
       final json = jsonDecode(response.body);
       print(json);
       Globals.success = json["success"];
    return res;
    }
    else{
      print(response.body);
      throw Exception('Failed to load album');
    }
  }
  Future lg (String user ,String password)async{
    print("lllllllllllll");
    Map body = {"username": user, "password": password};
    Map header=  {"Content-Type": "application/json"};
    var b = jsonEncode(body);
    print("calling url:$lgin");
    Network network=Network(lgin);
    var logint = await network.getData(b,headers:header );
    return logint;
  }

  
  Future  signup (String firstName,String secondName,String lastName, String email,String phoneNumber,String password,String username,String idNumber ) async {
    Map body = {"password":password,"phoneNumber":phoneNumber,
    "firstName":firstName,"secondName":secondName,"lastName":lastName,"email":email,"username":username,"idNumber":idNumber};
    var b = json.encode(body);
    print("url is, $reg");
    final response = await post(reg,
        headers: {"Content-Type": "application/json"}, body: b);
    if (response.statusCode == 200) {
       final json = jsonDecode(response.body); 
       Globals.success = json["success"];
       return response.body;
    }
    else{
      print(response.statusCode);
      throw Exception('Failed to load album');
    }
  }
}