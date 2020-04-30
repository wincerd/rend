import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Account {
  final int username;
  final String name;
  final int phoneNumber;
  


  Account({this.username, this.name, this.phoneNumber});
}
