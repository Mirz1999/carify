import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  //Fields
  final FirebaseAuth _auth;
  final googleSignInstance = GoogleSignIn();

  //Constructor
  AuthenticationService(this._auth);

//Google Sign in Method
  Future<UserCredential> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await googleSignInstance.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    return await _auth.signInWithCredential(credential);
  }

//Function SignUp with email
  Future<UserCredential> signUp({String email, String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use')
        print('the account already exists for the email.');
    } catch (e) {
      print(e);
    }
    return Future.value(userCredential);
  }

  Future<UserCredential> login({String email, String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return Future.value(userCredential);
  }

  // Sign Out
  Future<void> signOutUser() async {
    User user = _auth.currentUser;
    if (user.providerData[1].providerId == 'google.com') {
      await googleSignInstance.disconnect();
    }
    await _auth.signOut();
  }
}
