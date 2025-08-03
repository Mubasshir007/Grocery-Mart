import 'package:flutter/material.dart';

class UiHelper {
  static UiText({
    required String data,
    required double textsize,
    required FontWeight textweight,
    Color? textcolor,
  }) {
    return Text(
      data,
      style: TextStyle(
          fontSize: textsize,
          fontWeight: textweight,
          color: textcolor ?? Colors.black,
          fontFamily: "Gilroy"),
    );
  }
}
