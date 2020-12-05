import 'package:closor/bloc/LeadChnage/lead_change_bloc.dart';
import 'package:closor/bloc/LeadChnage/lead_change_event.dart';
import 'package:closor/bloc/LeadChnage/lead_change_state.dart';
import 'package:closor/bloc/lead/leads_bloc.dart';
import 'package:closor/bloc/lead/leads_event.dart';
import 'package:closor/model/lead.dart';
import 'package:closor/model/product.dart';
import 'package:closor/model/qualified.dart';
import 'package:closor/screens/notification_a_Screen.dart';
import 'package:closor/widgets/rasied_btn_widget.dart';
import 'package:closor/widgets/snakBar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import 'main_dashboard_screen.dart';
import 'package:closor/helper/launhers.dart';

class LeadInfoScreen extends StatelessWidget {
  Lead lead;

  @override
  Widget build(BuildContext context) {
    lead = ModalRoute.of(context).settings.arguments;
    getToken();
    return BlocProvider(
      create: (context) => LeadChangeBLoc(),
      child: Scaffold(
          appBar: buildAppBar(context),
          body: BlocConsumer<LeadChangeBLoc, LeadChangeState>(
            listener: (context, state) {
              if (state is LeadChangeUninitialized) {
              } else if (state is LeadChangeSuccess) {
                LeadsBloc leadsBloc = BlocProvider.of(context);
                leadsBloc.add(LeadFetch());
                return showSnackBar(context, state.qualified.message ?? '');
              } else if (state is LeadChangeFailed) {
                return showSnackBar(context, state.error ?? '');
              }
            },
            builder: (context, state) {
              LeadChangeBLoc leadChangeBLoc = BlocProvider.of(context);
              return buildPadding(context, state, leadChangeBLoc);
            },
          )),
    );
  }

  Padding buildPadding(BuildContext context, LeadChangeState state,
      LeadChangeBLoc leadChangeBLoc) {
    if (lead.product == null) lead.product = Product();
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              lead.name ?? '',
              style: kTextStyle.copyWith(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: lead.lead
                .map((e) => buildRowLead(e.key, e.value.toString()))
                .toList(),
          ),
          Spacer(),
          lead.hideQualification
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          leadChangeBLoc.add(
                            LeadChangeQualifiedPressed(
                              qualified: Qualified.changeState(2, lead.id),
                            ),
                          );
                        },
                        child: buildContainerIcon(
                            'Unqualified', Icons.thumb_down, Colors.red),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          leadChangeBLoc.add(
                            LeadChangeQualifiedPressed(
                              qualified: Qualified.changeState(1, lead.id),
                            ),
                          );
                        },
                        child: buildContainerIcon(
                            'Qualified', Icons.thumb_up, Color(0xFF3EC28F)),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          MLaucher.openWhatsApp(lead.phone);
                        },
                        child: buildContainerImage('WhatsApp',
                            "assets/icons/whats.svg", Color(0xFF4385F6)),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          MLaucher.sendMail(lead.email);
                        },
                        child: buildContainerImage('Email',
                            "assets/icons/email.svg", Color(0xFFFBBD06)),
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: 30,
          ),
          RasiedButtonWidget(
            text: "Call Lead",
            onPress: () {
              MLaucher.makePhoneCall(lead.phone);
            },
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget buildRowLead(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${key[0].toUpperCase()}${key.substring(1)}',
              style: kTextStyle.copyWith(fontSize: 15),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: kTextStyle.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainerIcon(String text, IconData icon, Color color) {
    return Container(
      color: color,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget buildContainerImage(String text, String image, Color color) {
    return Container(
      color: color,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          SvgPicture.asset(
            image,
            height: 30,
            width: 30,
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Lead Info",
        style: kTextStyle.copyWith(
            color: Colors.white, fontWeight: FontWeight.w600),
      ),
      elevation: 0,
      backgroundColor: kMainColor,
      iconTheme: IconThemeData(color: Colors.white),
//      leading: IconButton(
//        onPressed: () {
//          Navigator.pop(context);
//        },
//        iconSize: 30,
//        icon: Icon(
//          Icons.arrow_back_ios,
//          color: Colors.white,
//        ),
//      ),
    );
  }

  void getToken() async {
    print(await FirebaseMessaging().getToken());
  }
}
