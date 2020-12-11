import 'package:carify/screens/register_screen.dart';
import 'package:carify/utilities/constants.dart';
import 'package:carify/utilities/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carify/utilities/size_config.dart';
import 'package:carify/utilities/extracted_widget.dart';
import 'package:carify/utilities/user_authentication.dart';
import 'package:provider/provider.dart';
import 'package:carify/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//TODO REFACTORING
class _LoginScreenState extends State<LoginScreen> {
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
        body: SingleChildScrollView(
          child: Column(
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 95,
                        height: SizeConfig.safeBlockVertical * 7,
                        decoration: kInputTextFieldDecoration,
                        child: InputFields(
                          hintText: 'Email',
                          prefixIcon: Icons.person_outline_sharp,
                          validatorFunction: (input) {
                            if (input.isEmpty) return 'Enter Email';
                          },
                          saveFunction: (input) => _email = input,
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
                            if (input.length < 6)
                              return 'Provide Minimum 6 Characters';
                          },
                          saveFunction: (input) => _password = input,
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
                        child: RoundedButton(
                            buttonText: 'Login',
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                            onPressed: () async {
                              if(_formKey.currentState.validate()){
                                loading(context);
                                bool login = await authenticationService.signin(_email, _password);
                                if(login != null) {
                                  Navigator.of(context).pop();
                                  if (!login) print(
                                      'email and password are wrong');
                                }
                              }
                              // print(await authenticationService.user);
                              // final result = await authenticationService.signinAnonymously
                              // if(result != null ){
                              //   print("connected");
                              //   print(result);
                              // }else{
                              //   print("failure");
                              // }
                            }),
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }
}
