import 'dart:async';
import 'dart:convert';
import 'package:closor/model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  static final String USER = 'USER';

  static Future<void> deleteUser() async {
    final storage = new FlutterSecureStorage();
    await storage.delete(key: USER);
    return;
  }

  static Future<void> persistUser(User user) async {
    /// write to keystore/keychain
    final storage = new FlutterSecureStorage();
//    await storage.write(key:USER , value: empCode);
    return await storage.write(key: USER, value: JsonCodec().encode(user));
  }

  static Future<String> hasUser() async {
    /// read from keystore/keychain
    final storage = new FlutterSecureStorage();
    return await storage.read(key: USER);
  }
}
