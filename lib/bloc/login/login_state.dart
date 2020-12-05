import 'package:closor/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginUninitialized extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  User user;

  LoginSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}
class LoginData extends LoginState {

  LoginData();

  @override
  List<Object> get props => [];
}


class LoginFailed extends LoginState {
  String error;

  LoginFailed({@required this.error});

  @override
  List<Object> get props => [error];
}
