// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..code = json['code'] as int
    ..id = json['id'] as int
    ..user_id = json['user_id'] as int
    ..is_available = json['is_available'] as int
    ..email = json['email'] as String
    ..password = json['password'] as String
    ..message = json['message'] as String
    ..name = json['name'] as String
    ..country_code = json['country_code'] as int
    ..phone = json['phone'] as String
    ..device_token = json['device_token'] as String
    ..country_iso = json['country_iso'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'user_id': instance.user_id,
      'is_available': instance.is_available,
      'email': instance.email,
      'password': instance.password,
      'message': instance.message,
      'name': instance.name,
      'country_code': instance.country_code,
      'phone': instance.phone,
      'device_token': instance.device_token,
      'country_iso': instance.country_iso,
    };
