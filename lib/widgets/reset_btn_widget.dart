import 'package:closor/repository/user_repository.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResetButtonWidget extends StatelessWidget {
  String text;

  ResetButtonWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          UserRepository.forgetPassword(email: text);
        showDialog(
          context: context,
          builder: (context) => GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Material(
              type: MaterialType.transparency,
              child: Center(
                child: Container(
                  width: 400,
                  height: 100,
                  color: Color(0x707070),
                  child: Column(
                    children: [
                      Text(
                        'Password reset link has been sent to',
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        text,
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Tab anywhere to close',
                        style: kTextStyle.copyWith(
                            color: Colors.grey[400],
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Text(
        "Reset password?",
        textAlign: TextAlign.start,
        style: kTextStyle.copyWith(
            fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
      ),
    );
  }
}
