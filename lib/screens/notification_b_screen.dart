import 'package:closor/widgets/rasied_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import 'main_dashboard_screen.dart';

class NotificationBScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Ahmed Mohsen",
              style: kTextStyle.copyWith(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Email",
                        style: kTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "ahmed@closor.com",
                        style: kTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Product",
                        style: kTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Newer Mesa House #351",
                        style: kTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Phone Number",
                        style: kTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "+20 101 6789 919",
                        style: kTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Custom Question #1",
                        style: kTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "5",
                        style: kTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Custom Question #2",
                        style: kTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Garden, Pool",
                        style: kTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Source",
                        style: kTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Website | Widget Name",
                        style: kTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Submitted on",
                        style: kTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "{timestamp}",
                        style: kTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Spacer(),
            RasiedButtonWidget(
              text: "Call Lead",
              top: 40,
              bottom: 40,
              left: 150,
              right: 150,
              onPress: () {},
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
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
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        iconSize: 35,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
