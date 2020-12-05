import 'package:closor/bloc/authentication/authentication.dart';
import 'package:closor/routes.dart';
import 'package:closor/screens/lead_info_screen.dart';
import 'package:closor/screens/login_invited_screen.dart';
import 'package:closor/screens/login_regular_screen.dart';
import 'package:closor/screens/main_dashboard_screen.dart';
import 'package:closor/screens/notification_a_Screen.dart';
import 'package:closor/screens/notification_b_screen.dart';
import 'package:closor/screens/ring_screen.dart';
import 'package:closor/screens/user_profile_setting_screen.dart';
import 'package:closor/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/LeadChnage/lead_change_bloc.dart';
import 'bloc/lead/leads_bloc.dart';
import 'bloc/lead/leads_event.dart';
import 'screens/login_regular_screen.dart';
import 'screens/main_dashboard_screen.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (_) => AuthenticationBloc()..add(AppStarted()),
          ),
          BlocProvider<LeadChangeBLoc>(
            create: (_) => LeadChangeBLoc(),
          ), BlocProvider<LeadsBloc>(
            create: (_) => LeadsBloc()..add(LeadFetch()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          routes: routes,
//        home: RingScreen(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WelcomeScreen());
  }
}
