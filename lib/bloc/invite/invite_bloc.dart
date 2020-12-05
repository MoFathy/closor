import 'package:closor/bloc/invite/invite_state.dart';
import 'package:closor/model/login_response.dart';
import 'package:closor/model/user.dart';
import 'package:closor/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/user_repository.dart';
import 'invite_event.dart';

class InviteBloc extends Bloc<InviteEvent, InviteState> {
  InviteBloc() : super(InviteUninitialized());

  @override
  Stream<InviteState> mapEventToState(InviteEvent event) async* {
    if (event is InvitePressed) {
      yield* inviteUser(event);
    }
  }

  Stream<InviteState> inviteUser(InvitePressed event) async* {
    yield InviteLoading();

    LoginResponse inviteUser =
        await UserRepository.InviteNewUser(inviteUser: event.inviteUser);
    if (inviteUser.code == 0) {
      yield InviteSuccess(inviteUser: inviteUser.user);
    } else {
      yield InviteFailed(error: inviteUser.message);
    }
  }
}
