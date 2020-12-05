import 'package:closor/bloc/login/login_bloc.dart';
import 'package:closor/bloc/login/login_event.dart';
import 'package:closor/bloc/login/login_state.dart';
import 'package:closor/constants.dart';
import 'package:closor/helper/Validator.dart';
import 'package:closor/helper/navigator.dart';
import 'package:closor/model/user.dart';
import 'package:closor/routes.dart';
import 'package:closor/screens/login_regular_screen.dart';
import 'package:closor/widgets/loading.dart';
import 'package:closor/widgets/rasied_btn_widget.dart';
import 'package:closor/widgets/snakBar.dart';
import 'package:closor/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBLoc>(
      create: (context) => LoginBLoc(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                BlocConsumer<LoginBLoc, LoginState>(listener: (context, state) {
              if (state is LoginSuccess) {
                pushNameWithArguments(
                    context, LOGIN_PASSWORD, state.user.email);
              } else if (state is LoginFailed) {
                showSnackBar(context, state.error);
              }else if(state is LoginData){
                pushNameWithArguments(context, LOGIN_NEW, emailController.text);

              }
            }, builder: (context, state) {
              LoginBLoc loginBLoc = BlocProvider.of(context);
              return buildSingleChildScrollView(context, state, loginBLoc);
            }),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(
      BuildContext context, LoginState state, LoginBLoc loginBLoc) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Image.asset('assets/icons/closor logo.png'),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Sync & call leads instantly.",
                  style: kTextStyle,
                ),
              ),
            ),
            Center(
              child: Text(
                "Close more deals.",
                style: kTextStyle,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Log in or sign up",
              textAlign: TextAlign.center,
              style: kTextStyle.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
                validator: validatorEmail,
                controller: emailController,
                hintText: "Email address",
//                    text2: "Wrong Email!",
                isobscureText: false),
            SizedBox(
              height: 20.0,
            ),
            state is LoginLoading
                ? Loading()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RasiedButtonWidget(
                      top: 20,
                      bottom: 20,
                      text: "Continue",
                      onPress: () {
                        if (!formKey.currentState.validate()) {
                          return;
                        }
                        loginBLoc.add(
                          LoginContinuePressed(
                            user: User.email(emailController.text),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
