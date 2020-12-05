import 'package:closor/model/qualified.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LeadsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitializeLeads extends LeadsEvent {}

class LeadFetch extends LeadsEvent {}
class LeadChange extends LeadsEvent {
  Qualified qualified;
  LeadChange({@required this.qualified});

  @override
  List<Object> get props => [qualified];
}

class LeadSearch extends LeadsEvent {
  String  searchText;
  LeadSearch({@required this.searchText});

  @override
  List<Object> get props => [searchText];
}
