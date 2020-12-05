import 'package:closor/model/qualified.dart';
import 'package:closor/model/user.dart';
import 'package:closor/repository/lead_repository.dart';
import 'package:closor/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lead_change_event.dart';
import 'lead_change_state.dart';

class LeadChangeBLoc extends Bloc<LeadChangeEvent, LeadChangeState> {
  LeadChangeBLoc() : super(LeadChangeUninitialized());

  @override
  Stream<LeadChangeState> mapEventToState(LeadChangeEvent event) async* {
    if (event is LeadChangeQualifiedPressed) {
      yield* LeadQualified(event);
    } if (event is ChangeAvailablePressed) {
      yield* changeAvaliable(event);
    }
  }

  Stream<LeadChangeState> LeadQualified(
      LeadChangeQualifiedPressed event) async* {
    yield LeadChangeLoading();

    Qualified qualified =
        await LeadRepository.qualified(qualified: event.qualified);
    if (qualified.code == 0) {
      yield LeadChangeSuccess(qualified: qualified);
    } else {
      yield LeadChangeFailed(error: qualified.message);
    }
  }
  Stream<LeadChangeState> changeAvaliable(
      ChangeAvailablePressed event) async* {
    yield LeadChangeLoading();

    Qualified qualified =
    await LeadRepository.changeAvailable(user: event.user);
    if (qualified.code == 0) {
      yield LeadAvailableChangeSuccess(available: event.user.is_available);
    } else {
      yield LeadChangeFailed(error: qualified.message);
    }
  }
}
