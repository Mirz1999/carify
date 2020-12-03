import 'package:carify/screens/register_screen.dart';
import 'package:carify/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carify/utilities/size_config.dart';
import 'package:carify/utilities/extracted_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//TODO REFACTORING
class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
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
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 7.5,
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
                      Positioned(
                        top: SizeConfig.safeBlockVertical * 35,
                        left: SizeConfig.safeBlockHorizontal * 35,
                        right: SizeConfig.safeBlockHorizontal * 35,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 8,
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
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: SizeConfig.safeBlockHorizontal * 95,
              height: SizeConfig.safeBlockVertical * 8,
              child: InputFields(
                hintText: 'Username',
                prefixIcon: Icons.person_outline_sharp,
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: SizeConfig.safeBlockHorizontal * 95,
              height: SizeConfig.safeBlockVertical * 8,
              decoration: BoxDecoration(),
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
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 7),
              width: SizeConfig.safeBlockHorizontal * 95,
              height: SizeConfig.safeBlockVertical * 7.5,
              child: RawMaterialButton(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text('Login'),
                  fillColor: kOrangeCustom, //TODO REFACTOR
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 3,
            ),
            RichText(
              text: TextSpan(
                  text: 'Want to create an account ? ',
                  style: TextStyle(color: kMidnightBlueCustom),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign Up',
                        style: kSignUpTextStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          }),
                  ]),
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
          ],
        ),
      ),
    );
  }
}
