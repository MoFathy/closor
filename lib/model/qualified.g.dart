// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qualified.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Qualified _$QualifiedFromJson(Map<String, dynamic> json) {
  return Qualified()
    ..id = json['id'] as int
    ..status = json['status'] as int
    ..code = json['code'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$QualifiedToJson(Qualified instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
