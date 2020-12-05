import 'package:closor/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UpdateEvent extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfile extends UpdateEvent {
  User user;
  UpdateProfile({@required this.user});

  @override
  List<Object> get props => [user];
}
