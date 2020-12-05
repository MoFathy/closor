import 'package:closor/model/lead.dart';
import 'package:closor/model/lead_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LeadsState extends Equatable {
  @override
  List<Object> get props => [];
}

class LeadsInitialized extends LeadsState {}

class LeadsLoading extends LeadsState {}

class LeadsLoaded extends LeadsState {
  List<Lead> leads;

  LeadsLoaded({@required this.leads});

  @override
  List<Object> get props => [this.leads];
}

class LeadsFailed extends LeadsState {
  String error;

  LeadsFailed({@required this.error});

  @override
  List<Object> get props => [this.error];
}
