import 'package:flutter/material.dart';
import 'package:carify/utilities/constants.dart';
//TODO Extract the necessary widgets

class InputPasswordFields extends StatelessWidget {
  final bool showPassword;
  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Function onPressed;

  InputPasswordFields(
      {@required this.showPassword,
      @required this.hintText,
      @required this.prefixIcon,
      this.suffixIcon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextField(
        showCursor: false,
        obscureText: showPassword,
        decoration: kInputTextDecoration.copyWith(
          suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              color: kDarkBlueCustom,
              onPressed: onPressed),
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            color: kDarkBlueCustom,
          ),
        ));
  }
}

class InputFields extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;

  InputFields({
    @required this.hintText,
    @required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        showCursor: false,
        decoration: kInputTextDecoration.copyWith(
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            color: kDarkBlueCustom,
          ),
        ));
  }
}
