import 'package:closor/bloc/update/update_event.dart';
import 'package:closor/bloc/update/update_state.dart';
import 'package:closor/model/user.dart';
import 'package:closor/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateUninitialized());

  @override
  Stream<UpdateState> mapEventToState(UpdateEvent event) async* {
    if (event is UpdateProfile) {
      yield* updateProfile(event);
    }
  }

  Stream<UpdateState> updateProfile(UpdateProfile event) async* {
    yield UpdateLoading();

    User user = await UserRepository.UpdateProfile(user: event.user);
    if (user.code == 0) {
      yield UpdateSuccess(user: user);
    } else {
      yield UpdateFaild(error: user.message);
    }
  }
}
