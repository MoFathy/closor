import 'dart:core';

import 'package:closor/screens/lead_info_screen.dart';
import 'package:closor/screens/login_invited_screen.dart';
import 'package:closor/screens/login_regular_screen.dart';
import 'package:closor/screens/ring_screen.dart';
import 'package:closor/screens/splash.dart';
import 'package:closor/screens/welcome_screen.dart';

import 'screens/main_dashboard_screen.dart';
import 'screens/user_profile_setting_screen.dart';

var SPLASH = '/';
var LOGIN_EMAIL = '/LoginEmail';
var LOGIN_PASSWORD = '/LoginPassword';
var LOGIN_NEW = '/LoginNew';
var MAIN_DASHBOARD = '/MainDashBoard';
var USER_PROFILE_SITTING = '/UserProfileSitting';
var LEAD_INFO = '/LeadInfo';
var RING = '/ring';

var routes = {
  SPLASH: (context) => SplashScreen(),
  LOGIN_EMAIL: (context) => WelcomeScreen(),
  LOGIN_PASSWORD: (context) => LoginRegualrScreen(),
  LOGIN_NEW: (context) => LoginInvitedScreen(),
  MAIN_DASHBOARD: (context) => MainDashBoardScreen(),
  USER_PROFILE_SITTING: (context) => UserProfileSittingScreen(),
  LEAD_INFO: (context) => LeadInfoScreen(),
  RING: (context) => RingScreen()
};
