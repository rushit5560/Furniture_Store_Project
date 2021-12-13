import 'package:flutter/material.dart';

InputDecoration formInputDecoration({String? hintText}) {
  return InputDecoration(
    hintText: '$hintText',
    isDense: true,
    contentPadding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 2),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}