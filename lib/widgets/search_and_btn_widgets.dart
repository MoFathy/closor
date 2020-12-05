import 'package:flutter/material.dart';

import '../constants.dart';

class SearchAndButtonWidgets extends StatelessWidget {
  Function(String) onChange;

  SearchAndButtonWidgets({Key key, this.onChange}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 50,
//          width: 370,
            child: Center(
              child: TextField(
                onChanged: onChange,
                decoration: InputDecoration(
                  hintText: "Search Leads",
                  hintStyle: kTextStyle,
                  fillColor: KSecondColor,
                  filled: true,
                  border:inputBorder,
                  enabledBorder: inputBorder
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder inputBorder = new OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: const BorderRadius.all(
      const Radius.circular(10.0),
    ),
  );
}
