import 'package:closor/bloc/authentication/authentication.dart';
import 'package:closor/widgets/loading.dart';
import 'package:closor/widgets/reset_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:closor/constants.dart';
import 'package:closor/widgets/rasied_btn_widget.dart';
import 'package:closor/widgets/textfield_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import '../helper/Validator.dart';
import '../helper/navigator.dart';
import '../model/user.dart';
import '../routes.dart';

class LoginRegualrScreen extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  String email;

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context).settings.arguments;
    // if (email == null) {
    //   email = 'a7medkamal775@gmail.com';
    // }

    return BlocProvider<LoginBLoc>(
      create: (context) => LoginBLoc(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<LoginBLoc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  AuthenticationBloc authenticationBloc =BlocProvider.of(context);
                  authenticationBloc.add(LoggedIn(user: state.user));
                  pushName(
                    context,
                    MAIN_DASHBOARD,
                  );
                } else if (state is LoginFailed) {}
              },
              builder: (context, state) {
                LoginBLoc loginBLoc = BlocProvider.of(context);
                return buildSingleChildScrollView(context, state, loginBLoc);
              },
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(
      BuildContext context, LoginState state, LoginBLoc loginBLoc) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/closor logo.png'),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Text(
              "Sync & call leads instantly.",
              style: kTextStyle,
            ),
          ),
          Center(
            child: Text(
              "Close more deals.",
              style: kTextStyle,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          TextFieldWidget(
            validator: validatorRequired,
            controller: passwordController,
            hintText: "Password",
            isobscureText: true,
          ),
          SizedBox(
            height: 8.0,
          ),
          state is LoginLoading
              ? Loading()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RasiedButtonWidget(
                    text: "Log In",
                    onPress: () {
                      loginBLoc.add(
                        LoginPressed(
                          user: User.emailPassword(
                              email, passwordController.text),
                        ),
                      );
                    },
                  ),
                ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ResetButtonWidget(email),
          )
        ],
      ),
    );
  }
}
