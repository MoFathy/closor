import 'package:closor/bloc/login/login_event.dart';
import 'package:closor/bloc/login/login_state.dart';
import 'package:closor/model/login_response.dart';
import 'package:closor/model/user.dart';
import 'package:closor/repository/user_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';

class LoginBLoc extends Bloc<LoginEvent, LoginState> {
  LoginBLoc() : super(LoginUninitialized());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginContinuePressed) {
      yield* loginEmail(event);
    } else if (event is LoginPressed) {
      yield* loginEmailWithPassword(event);
    }
  }

  Stream<LoginState> loginEmail(LoginContinuePressed event) async* {
    yield LoginLoading();

    User user = await UserRepository.emailLogin(user: event.user);
    if (user.code == 0) {
      yield LoginSuccess(user: user);
    } else if (user.code == 2) {
      yield LoginData();
    } else {
      yield LoginFailed(error: user.message);
    }
  }

  Stream<LoginState> loginEmailWithPassword(LoginPressed event) async* {
    yield LoginLoading();
    event.user.device_token =await FirebaseMessaging().getToken();
    LoginResponse loginResponse =
        await UserRepository.emailLoginWithPassword(user: event.user);
    if (loginResponse.code == 0) {
      yield LoginSuccess(user: loginResponse.user);
    } else if (loginResponse.code == 2) {
      yield LoginData();
    } else {
      yield LoginFailed(error: loginResponse.message);
    }
  }
}
