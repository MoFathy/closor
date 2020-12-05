import 'package:closor/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class InviteState extends Equatable {
  const InviteState();

  @override
  List<Object> get props => [];
}

class InviteUninitialized extends InviteState {}

class InviteLoading extends InviteState {}

class InviteSuccess extends InviteState {
  User inviteUser;

  InviteSuccess({@required this.inviteUser});

  @override
  List<Object> get props => [inviteUser];
}

class InviteFailed extends InviteState {
  String error;

  InviteFailed({@required this.error});

  @override
  List<Object> get props => [error];
}
