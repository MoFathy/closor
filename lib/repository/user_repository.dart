import 'dart:convert';
import 'package:closor/bloc/config.dart';
import 'package:closor/model/lead_response.dart';
import 'package:closor/model/login_response.dart';
import 'package:closor/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static Future<User> emailLogin({@required User user}) async {
    var response = await http.post('$BASE_URL/login',
        body: jsonEncode(user.toJson()),
        headers: {"Content-Type": "application/json"});
    print(utf8.decode(response.bodyBytes));
    return User.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }

  static Future<LoginResponse> emailLoginWithPassword(
      {@required User user}) async {
    print(jsonEncode(user.toJson()));
    var response = await http.post('$BASE_URL/login1',
        body: jsonEncode(user.toJson()),
        headers: {"Content-Type": "application/json"});
    print(utf8.decode(response.bodyBytes));
    return LoginResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }

  static Future<LoginResponse> InviteNewUser(
      {@required User inviteUser}) async {
    print(jsonEncode(inviteUser.toJson()));
    var response = await http.post('$BASE_URL/login2',
        body: jsonEncode(inviteUser.toJson()),
        headers: {"Content-Type": "application/json"});
    //print(response.body);
    print(utf8.decode(response.bodyBytes));
    return LoginResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }

  static Future<LeadResponse> getLeads() async {
    var response = await http.get('$BASE_URL/all_leads',
        headers: {"Content-Type": "application/json"});
    print(response.body);
    print(utf8.decode(response.bodyBytes));
    return LeadResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }

  static Future<User> UpdateProfile({@required User user}) async {
    print(jsonEncode(user.toJson()));
    var response = await http.post('$BASE_URL/update_profile',
        body: jsonEncode(user.toJson()),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    print(utf8.decode(response.bodyBytes));
    return User.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }

  static Future<LoginResponse> forgetPassword({@required String email}) async {
    var response = await http.post('$BASE_URL/password/email',
        body: jsonEncode({'email': email}),
        headers: {
          "Content-Type": "application/json",
        });
    print(utf8.decode(response.bodyBytes));

    return LoginResponse.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
