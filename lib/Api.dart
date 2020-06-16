import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:rend/globals.dart';
import 'package:flutter/material.dart';
import 'user.dart';


class Api {
  static const String base_url = 'http://176.58.113.106/';
  static const String lgin = base_url + "api/login";
  static const String reg = base_url + 'api/user';
  static const String bor = base_url + "api/borrow/";
  static const String repy = base_url + "api/chargerequest/";
  static const String veri = base_url + "api/verify/";
  static const String transa = base_url + "api/transact/";


  

  Future all(String url, Map a) async {
    Map body = a;
    var b = json.encode(body);
    final response = await post(lgin,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
      var res = response.body;
      final json = jsonDecode(response.body);
      print(json);
      Globals.success = json["success"];
      return res;
    } else {
      print(response.body);
      throw Exception('error connecting');
    }
  }

  Future login(String user, String password) async {
    Map body = {"username": user, "password": password};
    var b = json.encode(body);
  
      final response = await post(lgin,
          headers: {"Content-Type": "application/json; charset=UTF-8"},
          body: b);
      if (response.statusCode == 200) {
        var res = response.body;
        final json = jsonDecode(response.body);
        print(json);
        Globals.success = json["success"];
        return res;
      } else {
        print(response.body);
        throw Exception('error connecting');
      }
  
  }
  Future verify(
      String userName,
      String firstName,
      String secondName,
      String lastname,
      String idNumber,
      String dob,
      String maritalStatus,
      String highestEducation,
      String employment,
      String employmentCompany,
      String salary,
      String userid) async {
    var url = veri + "/" + Globals.token;

    Map body = {
      "userName": userName,
      "firstName": firstName,
      "secondName": secondName,
      "lastName": lastname,
      "idNumber": idNumber,
      "dob": dob,
      "maritalStatus": maritalStatus,
      "highestEducation": highestEducation,
      "employment": employment,
      "employmentCompany": employmentCompany,
      "salary": salary,
      "userid": userid
    };
    var b = json.encode(body);
    final response = await post(url,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      return results;
    } else {
      print(response.statusCode);
      throw Exception('payment');
    }
  }
  

  Future signup(
      String firstName,
      String secondName,
      String lastName,
      String email,
      String phoneNumber,
      String password,
      String username,
      String idNumber) async {
    Map body = {
      "password": password,
      "phoneNumber": phoneNumber,
      "firstName": firstName,
      "secondName": secondName,
      "lastName": lastName,
      "email": email,
      "username": username,
      "idNumber": idNumber
    };
    var b = json.encode(body);
    print("url is, $reg");
    final response = await post(reg,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      return results;
    } else {
      print(response.statusCode);
      throw Exception('Failed to signup');
    }
  }
  Future borrow(int userId, String username, int requestedAmount,
      String phoneNumber, String currencyCode, String timeframe) async {
    Map body = {
      "userId": userId,
      "userName": username,
      "requestedAmount": requestedAmount,
      "phoneNumber": phoneNumber,
      "currencyCode": currencyCode,
      "timeframe": timeframe
    };
    var b = json.encode(body);
    print(b);
    var url = bor + Globals.token;
    final response = await post(url,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      return results;
    } else {
      print(response.statusCode);
      throw Exception('Failed to signup');
    }
  }

  Future repay(int userId, String username, int payAmount, String phoneNumber,
      int loanid) async {
    Map body = {
      "userId": userId,
      "userName": username,
      "amount": payAmount,
      "phoneNumber": phoneNumber,
      "loanid": loanid
    };
    var b = json.encode(body);
    var url = repy + Globals.token;
    final response = await post(url,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      return results;
    } else {
      print(response.statusCode);
      throw Exception('payment');
    }
  }

  Future transact(int userId, String phoneNumber) async {
    var url = transa + Globals.token;
    Map body = {"userid": userId, "phoneNumber": phoneNumber};
    var b = json.encode(body);
    final response = await post(url,
        headers: {"Content-Type": "application/json; charset=UTF-8"}, body: b);
    if (response.statusCode == 200) {
      var results = response.body;
      final j = jsonDecode(response.body);
      var tMap = json.decode(results);
      Globals.statme = tMap;
      return results;
    } else {
      print(response.statusCode);
      throw Exception('error retriving statment');
    }
  }
}
