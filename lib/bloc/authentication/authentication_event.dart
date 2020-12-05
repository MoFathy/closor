import 'package:closor/model/user.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {


  List get props =>[];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final User user;

  LoggedIn({@required this.user});
  List get props =>([user]);

  @override
  String toString() => 'LoggedIn { token: $user }';
}
class SaveAuth extends AuthenticationEvent {
  final User user;

  SaveAuth({@required this.user});
  List get props =>([user]);

  @override
  String toString() => 'LoggedIn { token: $user }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
