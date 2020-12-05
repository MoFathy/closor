// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadResponse _$LeadResponseFromJson(Map<String, dynamic> json) {
  return LeadResponse()
    ..code = json['code'] as String
    ..data = (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Lead.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$LeadResponseToJson(LeadResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
