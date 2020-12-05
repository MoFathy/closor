import 'package:closor/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class InviteEvent extends Equatable {
  const InviteEvent();

  @override
  List<Object> get props => [];
}

class InvitePressed extends InviteEvent {
  User inviteUser;
  InvitePressed({@required this.inviteUser});

  @override
  List<Object> get props => [inviteUser];
}
