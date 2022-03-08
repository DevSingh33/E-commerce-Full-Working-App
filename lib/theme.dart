import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData mainTheme() {
  return ThemeData(
    primarySwatch: Colors.orange,
    fontFamily: 'Muli',
    appBarTheme: mainAppBarTheme(),
    textTheme: mainTextTheme(),
    inputDecorationTheme: mainInputDecorationTheme(),
  );
}

InputDecorationTheme mainInputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 18,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme mainTextTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme mainAppBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 18,
      color: Color(0XFF8B8B8B),
    ),
  );
}
