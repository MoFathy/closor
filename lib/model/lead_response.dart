import 'package:closor/model/lead.dart';
import 'package:closor/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lead_response.g.dart';

@JsonSerializable()
class LeadResponse {
  String code;
  List<Lead> data;

  LeadResponse();

  factory LeadResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeadResponseToJson(this);
}
