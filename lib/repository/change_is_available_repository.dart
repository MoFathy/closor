import 'dart:convert';
import 'package:closor/bloc/config.dart';
import 'package:closor/model/change_is_available.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LeadRepository {
  static Future<ChangeIsAvailable> changeIsAvailable(
      {@required ChangeIsAvailable changeIsAvailable}) async {
    var response = await http.post('$BASE_URL/change_is_available',
        body: jsonEncode(changeIsAvailable.toJson()),
        headers: {"Content-Type": "application/json"});
    print(utf8.decode(response.bodyBytes));
    return ChangeIsAvailable.fromJson(
        JsonDecoder().convert(utf8.decode(response.bodyBytes)));
  }
}
