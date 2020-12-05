import 'package:closor/bloc/LeadChnage/lead_change_bloc.dart';
import 'package:closor/bloc/LeadChnage/lead_change_event.dart';
import 'package:closor/bloc/LeadChnage/lead_change_state.dart';
import 'package:closor/bloc/authentication/authentication.dart';
import 'package:closor/bloc/lead/leads_bloc.dart';
import 'package:closor/bloc/lead/leads_event.dart';
import 'package:closor/bloc/lead/leads_state.dart';
import 'package:closor/helper/data.dart';
import 'package:closor/helper/push_notification.dart';
import 'package:closor/model/leads_model.dart';
import 'package:closor/model/user.dart';
import 'package:closor/screens/lead_info_screen.dart';
import 'package:closor/widgets/card_leads_widgets.dart';
import 'package:closor/widgets/loading.dart';
import 'package:closor/widgets/search_and_btn_widgets.dart';
import 'package:closor/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../helper/navigator.dart';
import '../routes.dart';

class MainDashBoardScreen extends StatefulWidget {
  @override
  _MainDashBoardScreenState createState() => _MainDashBoardScreenState();
}

class _MainDashBoardScreenState extends State<MainDashBoardScreen> {
  AuthenticationBloc authenticationBloc;
  @override
  void initState() {

    LeadsBloc leadsBloc=BlocProvider.of(context);
    PushNotificationService pushNotificationService =PushNotificationService();
    pushNotificationService.initialise(context,leadsBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: BlocBuilder<LeadsBloc, LeadsState>(builder: (context, state) {
          LeadsBloc leadsBloc = BlocProvider.of(context);
          return buildColumn(leadsBloc, context, state);
        }),
      ),
    );
  }

  Column buildColumn(
      LeadsBloc leadsBloc, BuildContext context, LeadsState state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAndButtonWidgets(
            onChange: (value) {
              //   print(value);
              leadsBloc.add(
                LeadSearch(searchText: value),
              );
            },
          ),
        ),
        buildList(context, state)
      ],
    );
  }

  Widget buildList(context, state) {
    if (state is LeadsLoading) {
      return Center(
        child: Loading(),
      );
    } else if (state is LeadsLoaded) {
      return Expanded(
        child: ListView(
          children: state.leads
              .map(
                (e) => LeadsCardsWidget(
                  lead: e,
                ),
              )
              .toList(),
        ),
      );
    } else if (state is LeadsFailed) {
      return Text(state.error);
    }
    return Container();
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/Frame.svg",
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "Closor",
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
      iconTheme: IconThemeData(color: Colors.white),
//    centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: kMainColor,
//      leading: ,
      actions: [
        InkWell(
          onTap: () {
            pushName(
              context,
              USER_PROFILE_SITTING,
            );
          },
          child: SvgPicture.asset(
            "assets/icons/settings.svg",
          ),
        ),
        SizedBox(
          width: 10,
        ),
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          AuthenticationBloc authenticationBloc = BlocProvider.of(context);
          return BlocConsumer<LeadChangeBLoc, LeadChangeState>(
              listener: (context, state) {
            if (state is LeadAvailableChangeSuccess) {
              AuthenticationBloc authenticationBloc = BlocProvider.of(context);
              authenticationBloc.add(SaveAuth(
                  user: authenticationBloc.userData
                    ..is_available = state.available));
            }
          }, builder: (context, snapshot) {
            return state is LeadChangeLoading ||authenticationBloc.userData==null
                ? Loading()
                : Switch(
                    activeColor: Colors.green,
                    value: authenticationBloc.userData.is_available == 1,
                    onChanged: (value) {
                      LeadChangeBLoc leadChangeBloc = BlocProvider.of(context);
                      leadChangeBloc.add(ChangeAvailablePressed(
                          user: User.available(
                              authenticationBloc.userData.id, value ? 1 : 0)));
                    },
                  );
          });
        }),
      ],
    );
  }
}
