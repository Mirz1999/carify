import 'package:carify/utilities/constants.dart';
import 'package:carify/utilities/extracted_widget.dart';
import 'package:carify/utilities/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carify/utilities/user_authentication.dart';
import 'package:carify/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Fields
  bool showPassword = false;
  String _email, _password;
  AuthenticationService authenticationService = AuthenticationService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Transform.scale(
            scale: 1.15,
            child: Transform.translate(
              offset: Offset(0, -SizeConfig.safeBlockVertical * 7.5),
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 100,
                height: SizeConfig.safeBlockVertical * 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_1.png'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: SizeConfig.safeBlockVertical * 10,
                      left: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.safeBlockVertical * 12,
                      left: SizeConfig.safeBlockHorizontal * 30,
                      right: SizeConfig.safeBlockHorizontal * 30,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/carify_logo.svg',
                            // height: SizeConfig.safeBlockVertical * 12,
                            width: SizeConfig.safeBlockHorizontal * 40,
                          ),
                          Text(
                            'Carify', //TODO Choose a font and add it into yaml file + Refactor the styles in the constant file
                            style: GoogleFonts.lemonada(
                                fontSize: SizeConfig.safeBlockHorizontal * 7.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.safeBlockVertical * 30,
                      left: SizeConfig.safeBlockHorizontal * 20,
                      right: SizeConfig.safeBlockHorizontal * 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'DECIDE',
                            style: kSloganTextStyle,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'COMMIT',
                            style: kSloganTextStyle,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'SUCCEED',
                            style: kSloganTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Positioned(
                      top: SizeConfig.safeBlockVertical * 35,
                      left: SizeConfig.safeBlockHorizontal * 35,
                      right: SizeConfig.safeBlockHorizontal * 35,
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 7,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Form(
              key: _formKey,
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 95,
                height: SizeConfig.safeBlockVertical * 7,
                decoration: kInputTextFieldDecoration,
                child: InputFields(
                  hintText: 'Email Address',
                  prefixIcon: Icons.person_outline_sharp,
                  validatorFunction: (input) {
                    if (input.isEmpty) return 'Enter Email';
                  },
                  saveFunction: (input) => _email = input,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          Container(
            width: SizeConfig.safeBlockHorizontal * 95,
            height: SizeConfig.safeBlockVertical * 7,
            decoration: kInputTextFieldDecoration,
            child: InputPasswordFields(
              hintText: 'Password',
              showPassword: !showPassword,
              prefixIcon: Icons.lock_outline_sharp,
              suffixIcon: showPassword
                  ? Icons.visibility
                  : Icons.visibility_off_rounded,
              onPressed: () {
                setState(() => showPassword = !showPassword);
              },
              validatorFunction: (input) {
                if (input.length < 6) return 'Provide Minimum 6 Characters';
              },
              saveFunction: (input) => _password = input,
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 5,
          ),
          OutlineButton(
            splashColor: kMidnightBlueCustom,
            onPressed: () async {
              authenticationService.googleSignIn();
              Navigator.of(context).pop();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            highlightElevation: 0,
            borderSide: BorderSide(color: kMidnightBlueCustom),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image: AssetImage("assets/images/google_logo.png"),
                      height: 35.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: kMidnightBlueCustom,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 5,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 7),
            width: SizeConfig.safeBlockHorizontal * 95,
            height: SizeConfig.safeBlockVertical * 7.5,
            child: RoundedButton(
                buttonText: 'Next',
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    bool register = await authenticationService.signup(_email, _password);
                    if(register) Navigator.of(context).pop();
                  } else {
                    print('not validated');
                  }
                }),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: SizeConfig.safeBlockVertical * 0.15,
                width: SizeConfig.safeBlockHorizontal * 40,
                color: kMidnightBlueCustom,
              ),
              SvgPicture.asset(
                'assets/images/icon_clipboard.svg',
                width: SizeConfig.safeBlockHorizontal * 15,
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 0.15,
                width: SizeConfig.safeBlockHorizontal * 40,
                color: kMidnightBlueCustom,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
