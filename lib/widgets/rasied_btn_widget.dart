import 'package:flutter/material.dart';

import '../constants.dart';

class RasiedButtonWidget extends StatelessWidget {
  final double top, left, right, bottom;
  final String text;
  final Function onPress;
  const RasiedButtonWidget({
    Key key,
    @required this.text,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 4,
      onPressed: onPress,
      color: kMainColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          text,
          style: kTextStyle.copyWith(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
