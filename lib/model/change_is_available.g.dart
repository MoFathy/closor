// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_is_available.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeIsAvailable _$ChangeIsAvailableFromJson(Map<String, dynamic> json) {
  return ChangeIsAvailable()
    ..user_id = json['user_id'] as int
    ..is_available = json['is_available'] as int
    ..msg_en = json['msg_en'] as String;
}

Map<String, dynamic> _$ChangeIsAvailableToJson(ChangeIsAvailable instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'is_available': instance.is_available,
      'msg_en': instance.msg_en,
    };
