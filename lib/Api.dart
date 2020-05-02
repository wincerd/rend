import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:rend/globals.dart';


class Api{

  static const String base_url = 'http://176.58.113.106:80/';
  static const String lgin = base_url + "api/login";
  static const String reg = base_url + 'api/user';
  static const String  bor = base_url + "api/borrow/" ;
  static const String  repy = base_url + "api/chargerequest/";


Future all(String url , Map a) async{
  Map body= a;
  var b = json.encode(body);
  final response = await post(lgin,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
       var res  =response.body;
       final json = jsonDecode(response.body);
       print(json);
       Globals.success = json["success"];
    return res;
    }
    else{
      print(response.body);
      throw Exception('error connecting');
    }
}
 Future  login(String user, String password) async {
    Map body = {"username": user, "password": password};
    var b = json.encode(body);
    final response = await post(lgin,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
       var res  =response.body;
       final json = jsonDecode(response.body);
       print(json);
       Globals.success = json["success"];      
    return res;
    }
    else{
      print(response.body);
      throw Exception('error connecting');
    }
  }
  Future  verify(String userName , String firstName,String secondName,String lastname,
  String idNumber,String dob,String maritalStatus,String highestEducation,String employment,
  String employmentCompany,String salary) async {
    var url = lgin+"/"+Globals.token;
    print(url);  
    Map body = {"username": userName, "firstName":firstName,"secondName":secondName,
     "lastname":lastname,"idNumber": idNumber,"dob":dob,"maritalStatus":maritalStatus,
     "highestEducation":highestEducation,"employment":employment,"employmentCompany":
     employmentCompany,"salary":salary
    };
    var b = json.encode(body);
    final response = await post(url,
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
      throw Exception('error connecting');
    }
  }  
  Future  signup (String firstName,String secondName,String lastName, String email,String phoneNumber,String password,String username,String idNumber ) async {
    Map body = {"password":password,"phoneNumber":phoneNumber,
    "firstName":firstName,"secondName":secondName,"lastName":lastName,"email":email,"username":username,"idNumber":idNumber};
    var b = json.encode(body);
    print("url is, $reg");
    final response = await post(reg,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
       final j = jsonDecode(response.body); 
       Globals.success = j["success"];
       return j;
    }
    else{
      print(response.statusCode);
      throw Exception('Failed to signup');
    }
  }
 Future  borrow(int userId,String username, int requestedAmount,String phoneNumber,String currencyCode ) async {
    Map body = {"userId":userId,"userName":username,
    "requestedAmount":requestedAmount,"phoneNumber":phoneNumber,"currencyCode":currencyCode};
    var b = json.encode(body);
    print(b);
    var url = bor +  Globals.token;
    final response = await post(url,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
       final results = jsonDecode(response.body); 
       return results;
    }
    else{
      print(response.statusCode);
      throw Exception('Failed to signup');
    }
  }
  Future  repay (int userId,String username,int payAmount,String phoneNumber,String loanid) async {
    Map body = {"userId":userId,"userName":username,
    "amount":payAmount,"phoneNumber":phoneNumber,"loanid":loanid};
    var b = json.encode(body);
    print(b);
    var url = repy +  Globals.token;
    final response = await post(url,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
       final results = jsonDecode(response.body); 
       return results;
    }
    else{
      print(response.statusCode);
      throw Exception('Failed to signup');
    }
  }
}