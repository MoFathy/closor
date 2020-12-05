import 'package:closor/model/lead_data.dart';
import 'package:closor/model/product.dart';
import 'package:closor/model/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lead.g.dart';

@JsonSerializable()
class Lead {
  int id, product_id, status;
  String name, phone, email;
  Source source;
  String created_at;
//  String source;
  Product product;
  @JsonKey(ignore: true)
  bool hideQualification=false ;
  List<LeadData> lead;

  Lead();

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);

  Map<String, dynamic> toJson() => _$LeadToJson(this);
}
