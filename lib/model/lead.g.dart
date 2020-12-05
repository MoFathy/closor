// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lead _$LeadFromJson(Map<String, dynamic> json) {
  return Lead()
    ..id = json['id'] as int
    ..product_id = json['product_id'] as int
    ..status = json['status'] as int
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..email = json['email'] as String
    ..source = json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>)
    ..created_at = json['created_at'] as String
    ..product = json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>)
    ..lead = (json['lead'] as List)
        ?.map((e) =>
            e == null ? null : LeadData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$LeadToJson(Lead instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.product_id,
      'status': instance.status,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'source': instance.source,
      'created_at': instance.created_at,
      'product': instance.product,
      'lead': instance.lead,
    };
