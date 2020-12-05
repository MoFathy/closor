import 'package:closor/bloc/authentication/authentication.dart';
import 'package:closor/bloc/update/update_bloc.dart';
import 'package:closor/bloc/update/update_event.dart';
import 'package:closor/bloc/update/update_state.dart';
import 'package:closor/helper/navigator.dart';
import 'package:closor/model/user.dart';
import 'package:closor/screens/main_dashboard_screen.dart';
import 'package:closor/widgets/loading.dart';
import 'package:closor/widgets/rasied_btn_widget.dart';
import 'package:closor/widgets/snakBar.dart';
import 'package:closor/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants.dart';
import '../routes.dart';

class UserProfileSittingScreen extends StatefulWidget {
  @override
  _UserProfileSittingScreenState createState() =>
      _UserProfileSittingScreenState();
}

class _UserProfileSittingScreenState extends State<UserProfileSittingScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  int id;
  int country_code;
  String country_iso;
  String user_phone;
  String user_countryISOCode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthenticationBloc authenticationBloc = BlocProvider.of(context);
    nameController.text = authenticationBloc.userData.name;
    emailController.text = authenticationBloc.userData.email;
    phoneController.text = authenticationBloc.userData.phone;
    country_code = authenticationBloc.userData.country_code;
    id = authenticationBloc.userData.id;
    country_iso = authenticationBloc.userData.country_iso;
    user_phone = authenticationBloc.userData.phone;
    user_countryISOCode = authenticationBloc.userData.country_iso;

    print(country_iso);
  }

  @override
  Widget build(BuildContext context) {
    // id = ModalRoute.of(context).settings.arguments;

    return BlocProvider<UpdateBloc>(
      create: (context) => UpdateBloc(),
      child: Scaffold(
        appBar: buildAppBar(context),
        body: BlocConsumer<UpdateBloc, UpdateState>(listener: (context, state) {
          if (state is UpdateSuccess) {
//            pushName(context, LOGIN_EMAIL);
            AuthenticationBloc authenticationBloc = BlocProvider.of(context);
            authenticationBloc.add(SaveAuth(user: state.user));
            showSnackBar(context, state.user.message);
          } else if (state is UpdateFaild) {
            return showSnackBar(context, 'Wrong Data');
          }
        }, builder: (context, state) {
          UpdateBloc updateBloc = BlocProvider.of(context);
          return buildScaffold(context, state, updateBloc);
        }),
      ),
    );
  }

  Widget buildScaffold(
      BuildContext context, UpdateState state, UpdateBloc updateBloc) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: kTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFieldWidget(
                  controller: nameController,
                  hintText: "ahmed",
                  isobscureText: false),
              SizedBox(
                height: 10,
              ),
              Text(
                "Email",
                style: kTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFieldWidget(
                  controller: emailController,
                  hintText: "ahmed@closor.com",
                  isobscureText: false),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Mobile Number",
                  style: kTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                child: IntlPhoneField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      fillColor: KSecondColor,
                      contentPadding: EdgeInsets.all(20),
                      //            errorText: text2,
                      filled: true,
                      hintText: "+201016789919",
                      hintStyle: kTextStyle),
                  initialCountryCode: country_iso,
                  onSaved: (phone) => {
                    setState(() {
                      user_phone = phone.number;
                      user_countryISOCode = phone.countryISOCode;
                    }),
                    print(
                        'i was submitted 111111' + ' ' + phone.countryISOCode),
                  },
                  onChanged: (phone) {
                    setState(() {
                      user_phone = phone.number;
                      user_countryISOCode = phone.countryISOCode;
                    });
                    print(phone.countryCode +
                        ' ' +
                        phone.countryISOCode +
                        ' ' +
                        phone.number +
                        ' ' +
                        phoneController.text);
                  },
                ),
              ),
              // TextFieldWidget(
              //     controller: phoneController,
              //     hintText: "+201016789919",
              //     isobscureText: false),
              SizedBox(
                height: 10,
              ),
              Text(
                "Password",
                style: kTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFieldWidget(
                controller: passwordController,
                hintText: "*******",
                isobscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: state is UpdateLoading
                      ? Loading()
                      : RasiedButtonWidget(
                          text: "Update Profile",
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                          onPress: () {
                            _formKey.currentState.save();
                            Future.delayed(Duration(milliseconds: 1000), () {
                              updateBloc.add(
                                UpdateProfile(
                                  user: User.updateProfile(
                                      nameController.text,
                                      emailController.text,
                                      20,
                                      user_countryISOCode,
                                      user_phone,
                                      passwordController.text,
                                      id),
                                ),
                              );
                            });
                          },
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "My Profile",
        style: kTextStyle.copyWith(
            color: Colors.white, fontWeight: FontWeight.w600),
      ),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            AuthenticationBloc authentication = BlocProvider.of(context);
            authentication.add(LoggedOut());
            Navigator.of(context)
                .pushNamedAndRemoveUntil(LOGIN_EMAIL, (route) => false);
//            popAndPush(context, LOGIN_EMAIL);
          },
        )
      ],
      backgroundColor: kMainColor,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
}
