import 'package:closor/model/product.dart';
import 'package:closor/model/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lead_data.g.dart';

@JsonSerializable()
class LeadData {
  String key;
  dynamic value;

  LeadData();

  factory LeadData.fromJson(Map<String, dynamic> json) =>
      _$LeadDataFromJson(json);

  Map<String, dynamic> toJson() => _$LeadDataToJson(this);
}
