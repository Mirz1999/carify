import 'package:carify/screens/login_screen.dart';
import 'package:carify/utilities/user_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome'),
            if(user != null)Text('UID: ' + user.uid),
            Container(
              child: RaisedButton(
                  child: Text('bibi bye bye'),
                  onPressed: () {
                    authenticationService.signOut();
                    setState(() {});
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
