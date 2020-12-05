import 'package:closor/model/qualified.dart';
import 'package:closor/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LeadChangeState extends Equatable {
  const LeadChangeState();

  @override
  List<Object> get props => [];
}

class LeadChangeUninitialized extends LeadChangeState {}

class LeadChangeLoading extends LeadChangeState {}

class LeadChangeSuccess extends LeadChangeState {
  Qualified qualified;
  LeadChangeSuccess({@required this.qualified});

  @override
  List<Object> get props => [qualified];
}
class LeadAvailableChangeSuccess extends LeadChangeState {
  int  available;
  LeadAvailableChangeSuccess({@required this.available});

  @override
  List<Object> get props => [available];
}


class LeadChangeFailed extends LeadChangeState {
  String error;

  LeadChangeFailed({@required this.error});

  @override
  List<Object> get props => [error];
}
