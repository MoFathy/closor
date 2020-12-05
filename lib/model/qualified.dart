import 'package:json_annotation/json_annotation.dart';

part 'qualified.g.dart';

@JsonSerializable()
class Qualified {
  int id, status, code;
  String message;
  Qualified();

  Qualified.changeState(this.status, this.id);
  factory Qualified.fromJson(Map<String, dynamic> json) =>
      _$QualifiedFromJson(json);

  Map<String, dynamic> toJson() => _$QualifiedToJson(this);
}
