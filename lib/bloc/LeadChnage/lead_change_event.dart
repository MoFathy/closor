import 'package:closor/model/qualified.dart';
import 'package:closor/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LeadChangeEvent extends Equatable {
  const LeadChangeEvent();

  @override
  List<Object> get props => [];
}

class LeadChangeQualifiedPressed extends LeadChangeEvent {
  Qualified qualified;
  LeadChangeQualifiedPressed({@required this.qualified});

  @override
  List<Object> get props => [qualified];
}
//is_available
class ChangeAvailablePressed extends LeadChangeEvent {
  User user;
  ChangeAvailablePressed({@required this.user});

  @override
  List<Object> get props => [user];
}
