import 'package:carify/screens/login_screen.dart';
import 'package:carify/screens/profile_screen.dart';
import 'package:carify/utilities/user_authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {

  User user;
  AuthenticationService authenticationService = AuthenticationService();

  Future<void> getUser()async{
   final userResult = await authenticationService.user;
   setState(() {
     user = userResult;
   });
  }


  @override
  Widget build(BuildContext context) {
    getUser();
    return user == null? LoginScreen():ProfileScreen();
  }
}
