import 'package:closor/bloc/authentication/authentication.dart';
import 'package:closor/helper/navigator.dart';
import 'package:closor/helper/push_notification.dart';
import 'package:closor/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc,AuthenticationState>(
        listener: (context ,state){
          if(state is AuthenticationAuthenticated){
              popAndPush(context, MAIN_DASHBOARD);
          }else if (state is AuthenticationUnauthenticated){
            popAndPush(context, LOGIN_EMAIL);

          }
        },
        child: Center(
            child: Image.asset('assets/icons/closor logo.png'),

        ),
      ),
    );
  }
}
