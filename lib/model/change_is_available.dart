import 'package:closor/model/product.dart';
import 'package:closor/model/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_is_available.g.dart';

@JsonSerializable()
class ChangeIsAvailable {
  int user_id, is_available;
  String msg_en;

  ChangeIsAvailable();

  factory ChangeIsAvailable.fromJson(Map<String, dynamic> json) =>
      _$ChangeIsAvailableFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeIsAvailableToJson(this);
}
