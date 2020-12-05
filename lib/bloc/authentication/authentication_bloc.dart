import 'dart:async';
import 'dart:convert';

import 'package:closor/model/user.dart';
import 'package:closor/repository/authentication_repository.dart';
import 'package:closor/repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  String user;

  User get userData => User.fromJson(JsonDecoder().convert(user));

  AuthenticationBloc() : super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      user = await AuthenticationRepository.hasUser();
      if (user != null) {
        yield AuthenticationAuthenticated(user: userData);
      } else {
        yield AuthenticationUnauthenticated();
      }
    } else if (event is LoggedIn) {
      yield* _login(event);
    } else if (event is SaveAuth) {
      yield* _saveUser(event);
    } else if (event is LoggedOut) {
      yield* _logOut();
    }
  }

  Stream<AuthenticationState> _logOut() async* {
    yield AuthenticationLoading();
    await AuthenticationRepository.deleteUser();
    yield AuthenticationUnauthenticated();
  }

  Stream<AuthenticationState> _saveUser(SaveAuth event) async* {
    yield AuthenticationLoading();
    await AuthenticationRepository.persistUser(event.user);
    user = JsonEncoder().convert(event.user.toJson());

    yield AuthenticationAuthenticated(user: this.userData);
  }

  Stream<AuthenticationState> _login(LoggedIn event) async* {
    yield AuthenticationLoading();
    await AuthenticationRepository.persistUser(event.user);
    user = await AuthenticationRepository.hasUser();
    yield AuthenticationAuthenticated(user: this.userData);
  }
}
