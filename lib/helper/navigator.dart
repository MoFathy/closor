import 'package:flutter/material.dart';

//void  pushWidgetWithFade(BuildContext context, Widget widget) {
//  Navigator.of(context).push(
//    PageRouteBuilder(
//        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//            FadeTransition(opacity: animation, child: child),
//        pageBuilder: (BuildContext context, Animation animation,
//            Animation secondaryAnimation) {
//          return widget;
//        }),
//  );}

void pushPage(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => widget),
  );
}

void pushName(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

Future<dynamic> pushNameForResult(BuildContext context, String route) async {
  return await Navigator.of(context).pushNamed(route);
}

Future<dynamic> pushNameWithArgumentsForResult(
    BuildContext context, String route, argument) async {
  return await Navigator.of(context).pushNamed(route, arguments: argument);
}

void pushNameWithArguments(BuildContext context, String route, argument) {
  Navigator.of(context).pushNamed(route, arguments: argument);
}

pushPageForResult(BuildContext context, Widget widget) async {
  return await Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => widget),
  );
}

void popScreen(BuildContext context, int size) {
  int count = 0;
  Navigator.of(context).popUntil((_) => count++ >= size);
}

void popAndPush(BuildContext context, String route) {
  Navigator.of(context).popAndPushNamed(route);
}

pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return widget;
        }),
  );
}
