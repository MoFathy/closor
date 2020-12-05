import 'package:closor/bloc/authentication/authentication_bloc.dart';
import 'package:closor/bloc/authentication/authentication_event.dart';
import 'package:closor/bloc/invite/invite_bloc.dart';
import 'package:closor/bloc/invite/invite_event.dart';
import 'package:closor/bloc/invite/invite_state.dart';
import 'package:closor/model/user.dart';
import 'package:closor/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:closor/constants.dart';
import 'package:closor/widgets/rasied_btn_widget.dart';
import 'package:closor/widgets/textfield_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/navigator.dart';
import '../routes.dart';

class LoginInvitedScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String email;

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context).settings.arguments;

    return BlocProvider<InviteBloc>(
      create: (context) => InviteBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Center(
            child: BlocConsumer<InviteBloc, InviteState>(
          listener: (context, state) {
            if (state is InviteSuccess) {
              AuthenticationBloc authenticationBloc =BlocProvider.of(context);
              authenticationBloc.add(LoggedIn(user: state.inviteUser));
              pushName(
                context,
                MAIN_DASHBOARD,
              );
            } else if (state is InviteFailed) {

            }
          },
          builder: (context, state) {
            InviteBloc inviteBloc = BlocProvider.of(context);
            return buildSingleChildScrollView(context, inviteBloc, state);
          },
        )),
      ),
    );
  }

  Widget buildSingleChildScrollView(
      BuildContext context, InviteBloc inviteBloc, InviteState inviteState) {
    return BlocListener<InviteBloc,InviteState>(
      listener: (context,state){
        if(state is InviteSuccess){
          AuthenticationBloc authenticationBloc =BlocProvider.of(context);
          authenticationBloc.add(LoggedIn(user: state.inviteUser));
          pushName(
            context,
            MAIN_DASHBOARD,
          );
        }else {

        }
      },
      child: SingleChildScrollView(
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
              height: 40,
            ),
            Center(
              child: Text(
                "Welcome onboard, You are invited",
                style: kTextStyle,
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(text: "to  ", style: kTextStyle, children: [
                  TextSpan(
                    text: "AtumStudio",
                    style: kTextStyle.copyWith(
                        color: Color(0xFF34A855), fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: " workspace.", style: kTextStyle)
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  TextFieldWidget(
                    hintText: "Name",
                    isobscureText: false,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextFieldWidget(
                    hintText: "Mobile Number",
                    isobscureText: false,
                    controller: mobileController,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextFieldWidget(
                    hintText: "Password",
                    isobscureText: true,
                    controller: passwordController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            inviteState is InviteLoading
                ? Loading()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RasiedButtonWidget(
                      bottom: 50,
                      top: 20,
                      // left: 100,
                      // right: 100,
                      text: "Access Workspace",
                      onPress: () {
                        inviteBloc.add(
                          InvitePressed(
                            inviteUser: User.InviteUser(
                                nameController.text,
                                email,
                                mobileController.text,
                                passwordController.text),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
