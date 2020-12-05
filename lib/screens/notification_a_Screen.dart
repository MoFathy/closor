import 'package:closor/constants.dart';
import 'package:closor/screens/notification_b_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationAScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/Group 15.png",
          ),
          SizedBox(
            height: 150,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => NotificationBScreen(),
                ),
              );
            },
            child: Image.asset(
              "assets/icons/right_sign.png",
            ),
          ),
        ],
      )),
    );
  }
}
