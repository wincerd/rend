import 'dart:async';
import 'dart:convert' as Convert;
import 'dart:io';
import 'package:http/http.dart' as http;

typedef RequestCallBack = void Function(Map data);

class Network {
  final String baseUrl;

  Network(this.baseUrl);

  Future getData(var body, {Map<String, String> headers}) async {
    try {
      http.Response response = await http.post(baseUrl, body: body, headers: headers);
      final statusCode = response.statusCode;
      final responseBody = response.body;
      print('[uri=$baseUrl][statusCode=$statusCode][response=$responseBody]');
      return response;
    } on Exception catch (e) {
      print('[uri=$baseUrl]exception e=${e.toString()}');
      return '';
    }
  }
}