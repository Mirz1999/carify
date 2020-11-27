import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//TODO REFACTORING
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_1.png'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 60.0,
                        left: 90.0,
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        )),
                    Positioned(
                      top: 70.0,
                      left: 50.0,
                      right: 50.0,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/carify_logo.svg',
                            height: 50.0,
                            width: 50.0,
                          ),
                          Text(
                            'Carify',
                            style: GoogleFonts.lemonada(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: 350.0,
              height: 60.0,
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
              height: 20.0,
            ),
            Container(
              width: 350.0,
              height: 60.0,
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
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              width: 330.0,
              height: 50.0,
              child: RawMaterialButton(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text('Login'),
                  fillColor: Color(0xFFF77B00),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: 20.0,
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
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1.0,
                  width: 150.0,
                  color: Colors.black,
                ),
                SvgPicture.asset('assets/images/icon_clipboard.svg'),
                Container(
                  height: 1.0,
                  width: 150.0,
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
