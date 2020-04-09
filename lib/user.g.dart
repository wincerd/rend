// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    firstname: json['firstname'] as String,
    secondname: json['secondname'] as String,
    lastname: json['lastname'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as int,
    message: json['message'] as String,
    success: json['success'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'secondname': instance.secondname,
      'lastname': instance.lastname,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'success': instance.success,
      'message': instance.message,
    };

UserSession _$UserSessionFromJson(Map<String, dynamic> json) {
  return UserSession(
    name: json['name'] as String,
    token: json['token'] as String,
    number: json['number'] as int,
    loanamount: json['loanamount'] as int,
    amountBorrowed: json['amountBorrowed'] as int,
    amountRepaid: json['amountRepaid'] as int,
    loanlimit: json['loanlimit'] as int,
    loanAdvisory: json['loanAdvisory'] as String,
    loancode: json['loancode'] as int,
  );
}

Map<String, dynamic> _$UserSessionToJson(UserSession instance) =>
    <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'number': instance.number,
      'loanamount': instance.loanamount,
      'loanAdvisory': instance.loanAdvisory,
      'loancode': instance.loancode,
      'loanlimit': instance.loanlimit,
      'amountBorrowed': instance.amountBorrowed,
      'amountRepaid': instance.amountRepaid,
    };
