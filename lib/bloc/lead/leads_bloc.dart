import 'dart:math';

import 'package:closor/bloc/lead/leads_event.dart';
import 'package:closor/bloc/lead/leads_state.dart';
import 'package:closor/model/lead.dart';
import 'package:closor/model/lead_response.dart';
import 'package:closor/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  LeadsBloc() : super(LeadsInitialized());
  List<Lead> data = [];

  @override
  Stream<LeadsState> mapEventToState(LeadsEvent event) async* {
    if (event is LeadFetch) {
      yield* _getLeads(event);
    }
    if (event is LeadSearch) {
      yield* _leadSearch(event);
    }
    if (event is LeadChange) {
      yield* _leadChange(event);
    }
  }

  Stream<LeadsState> _leadSearch(LeadSearch event) async* {
    yield LeadsLoading();
    List<Lead> searched = data
        .where((element) => element.name!=null && element.name.toLowerCase().contains(event.searchText.toLowerCase()))
        .toList();

    yield LeadsLoaded(
        leads:searched);
  }
  Stream<LeadsState> _leadChange(LeadChange event) async* {
    yield LeadsLoading();

    data.firstWhere((element) => element.id==event.qualified.id).status=event.qualified.status;
    yield LeadsLoaded(
        leads:data);
  }

  // Get news from Api
  Stream<LeadsState> _getLeads(LeadFetch event) async* {
    yield LeadsLoading();
    // Check for Internet Connection
    // bool isConnected =
    //     await isInternetConnected(); //TODO : Handle Internet Error With Listener

    // if (isConnected) {
    LeadResponse leads = await UserRepository.getLeads();
    if (leads.code == '0') {
      data = leads.data;
      yield LeadsLoaded(leads: leads.data);
    } else {
      yield LeadsFailed(error: " Error "); //TODO : Handle Error Message

    }
    // } else {
    //   yield NewsLoadedError(
    //       error: " Interet Connection Error "); //TODO : Handle Error Message
    //
    // }
  }
}
