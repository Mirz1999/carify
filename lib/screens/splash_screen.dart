import 'dart:async';

import 'package:carify/screens/login_screen.dart';
import 'package:carify/screens/profile_screen.dart';
import 'package:carify/utilities/user_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carify/utilities/constants.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  @override
  void initState() {
    displaySplash();
    super.initState();
  }

  displaySplash() {
    Timer(Duration(seconds: 3), () {
      if (_auth.currentUser != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 1],
            colors: [
              kDarkBlueCustom,
              kMidnightBlueCustom,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/carify_logo.svg'),
            Text(
              'Carify', //TODO Choose a font and add it into yaml file + Refactor the styles in the constant file
              style: GoogleFonts.lemonada(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DECIDE',
                  style: kSloganTextStyle,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text('COMMIT', style: kSloganTextStyle),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'SUCCEED',
                  style: kSloganTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
