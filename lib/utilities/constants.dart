import 'package:flutter/material.dart';

//Colors
const kOrangeCustom = Color(0xFFf77b00);
const kDarkBlueCustom = Color(0xFF284b63);
const kMidnightBlueCustom = Color(0xFF153243);
const KLightOrangeCustom = Color(0xFFff9800);

// TODO fontStyle
const kSloganTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 11.0,
    letterSpacing: 2.0);

const kSignUpTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: kOrangeCustom,
);

// TextField style
const kInputTextDecoration = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(fontSize: 17.0),
  prefixIcon: Icon(
    Icons.person_outline,
    color: kDarkBlueCustom,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: kMidnightBlueCustom, width: 2.5),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kDarkBlueCustom, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);

//Container Decorations
var kInputTextFieldDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 3,
      offset: Offset(0, 2),
    ),
  ],
);
