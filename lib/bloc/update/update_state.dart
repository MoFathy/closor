import 'package:closor/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

class UpdateUninitialized extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateSuccess extends UpdateState {
  User user;

  UpdateSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class UpdateFaild extends UpdateState {
  String error;

  UpdateFaild({@required this.error});

  @override
  List<Object> get props => [error];
}
