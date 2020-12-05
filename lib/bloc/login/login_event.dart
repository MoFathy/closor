import 'package:closor/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginContinuePressed extends LoginEvent {
  User user;
  LoginContinuePressed({@required this.user});

  @override
  List<Object> get props => [user];
}

class LoginPressed extends LoginEvent {
  User user;
  LoginPressed({@required this.user});

  @override
  List<Object> get props => [user];
}
