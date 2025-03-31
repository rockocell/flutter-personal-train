import 'package:flutter/material.dart';

SnackBar showSnackBar(String guide, {required double bottomMargin}) {
  return SnackBar(
    content: Text(guide, textAlign: TextAlign.center),
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    margin: EdgeInsets.only(left: 20, right: 20, bottom: bottomMargin),
  );
}
