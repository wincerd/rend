

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String firstname;
  String secondname;
  String lastname;
  String username;
  String email;
  String phoneNumber;
  String success;
  String message;
  String loanBalance;
  String token;
  int id;
  String loanid;

  User(
      {this.firstname,
      this.secondname,
      this.lastname,
      this.username,
      this.email,
      this.phoneNumber,
      this.message,
      this.success,
      this.loanBalance,
      this.token,
      this.id});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserSession {
  String name;
  String token;
  int number;
  int loanamount;
  String loanAdvisory;
  int loancode;
  int loanlimit;
  int amountBorrowed;
  int amountRepaid;

  UserSession(
      {this.name,
      this.token,
      this.number,
      this.loanamount,
      this.amountBorrowed,
      this.amountRepaid,
      this.loanlimit,
      this.loanAdvisory,
      this.loancode});
  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}
