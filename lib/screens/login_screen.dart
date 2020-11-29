import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carify/utilities/size_config.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//TODO REFACTORING
class _LoginScreenState extends State<LoginScreen> {
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
                        top: SizeConfig.safeBlockVertical * 5,
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
                              'Carify',
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
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.0,
                                  letterSpacing: 2.0),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'COMMIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'SUCCEED',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.0,
                                letterSpacing: 2.0,
                              ),
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
                            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 8, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 95,
              height: SizeConfig.safeBlockVertical * 8,
              child: TextField(
                showCursor: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(fontSize: 17.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 95,
              height: SizeConfig.safeBlockVertical * 8,
              child: TextField(
                showCursor: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 17.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 7),
              width: SizeConfig.safeBlockHorizontal * 95,
              height: SizeConfig.safeBlockVertical * 7.5,
              child: RawMaterialButton(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text('Login'),
                  fillColor: Color(0xFFF77B00),
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
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF77B00),
                        ))
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
                  color: Colors.black,
                ),
                SvgPicture.asset('assets/images/icon_clipboard.svg',width:SizeConfig.safeBlockHorizontal * 15,),
                Container(
                  height: SizeConfig.safeBlockVertical * 0.15,
                  width: SizeConfig.safeBlockHorizontal * 40,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
