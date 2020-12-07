import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Fields
final FirebaseAuth _auth = FirebaseAuth.instance;
final googleSignInstance = GoogleSignIn();
User user = _auth.currentUser;

//Functions

//Google Sign in Method
Future<bool> googleSignIn() async {
  GoogleSignInAccount googleSignInAccount = await googleSignInstance.signIn();
  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    print(user.email);
  }
  return Future.value(true);
}

//Function SignUp with email
Future<User> signUp(String email, String password) async {
  final User user = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password))
      .user;
  if (user != null) {
    if (!user.emailVerified) {
      await user.sendEmailVerification();
      //TODO Handle Error with a good UI
      return Future.value(null);
    }
  }
  return Future.value(user);
}

Future<User> login(String email, String password) async {
  User user;
  try {
    user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
  } catch (e) {
    print(e);
    return Future.value(null);
    //TODO Handle Error with a good UI
  }
  return Future.value(user);
}

//Sign Out
Future<bool> signOutUser() async {
  user = _auth.currentUser;
  if (user.providerData[1].providerId == 'google.com') {
    await googleSignInstance.disconnect();
  }
  await _auth.signOut();
  return Future.value(true);
}
