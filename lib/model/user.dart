import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int code;
  int id;
  int user_id;
  int is_available;
  String email;
  String password;
  String message;
  String name;
  int country_code;
  String phone;
  String device_token;
  String country_iso;

  User();

  User.email(this.email);
  User.available(this.user_id, this.is_available);

  User.emailPassword(this.email, this.password);

  User.updateProfile(this.name, this.email, this.country_code, this.country_iso,
      this.phone, this.password, this.id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.InviteUser(this.name, this.email, this.phone, this.password);
}
