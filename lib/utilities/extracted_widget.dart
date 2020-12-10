import 'package:flutter/material.dart';
import 'package:carify/utilities/constants.dart';

//Input Field
class InputFields extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Function validatorFunction;
  final Function saveFunction;

  InputFields(
      {@required this.hintText,
      @required this.prefixIcon,
      this.validatorFunction,
      this.saveFunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: saveFunction,
        validator: validatorFunction,
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

//Input Password Field
class InputPasswordFields extends StatelessWidget {
  final bool showPassword;
  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Function onPressed;
  final Function validatorFunction;
  final Function saveFunction;

  InputPasswordFields(
      {@required this.showPassword,
      @required this.hintText,
      @required this.prefixIcon,
      this.suffixIcon,
      this.onPressed,
      this.validatorFunction,
      this.saveFunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: saveFunction,
        validator: validatorFunction,
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
//Rounded Button

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final Function onPressed;

  RoundedButton(
      {@required this.buttonText,
      @required this.fontSize,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        child: Text(buttonText),
        fillColor: kOrangeCustom,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        onPressed: onPressed);
  }
}
