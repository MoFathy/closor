import 'dart:convert';
import 'dart:io';

import 'package:closor/bloc/lead/leads_bloc.dart';
import 'package:closor/bloc/lead/leads_event.dart';
import 'package:closor/helper/navigator.dart';
import 'package:closor/model/lead.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
//BuildContext context;
  Future initialise(BuildContext context, LeadsBloc leadsBloc) async {
//    this.context=context;
    final bgMsg = (message) => onNotification(message, context, leadsBloc);

    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _fcm.configure(
        onBackgroundMessage: bgMsg,
        onLaunch: (message) => onNotification(message, context, leadsBloc),
        onMessage: (message) => onNotification(message, context, leadsBloc),
        onResume: (message) => onNotification(message, context, leadsBloc));
  }

  Future<dynamic> onNotification(
    Map<String, dynamic> message,
    BuildContext context,
    LeadsBloc leadsBloc,
  ) {
    try {
      if (message.containsKey('data')) {
        // Handle data message
        print(message.toString());
        final dynamic data = message['data'];
        final dynamic orderData = data['data'];
        Lead lead = Lead.fromJson(JsonDecoder().convert(orderData));
        lead.hideQualification = true;
        pushNameWithArguments(context, RING, lead);
        leadsBloc.add(LeadFetch());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
