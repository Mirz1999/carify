import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  //Fields
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future siginAnonymous() async {
    try{
      final result = await auth.signInAnonymously();
      return result.user;
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<User> get user async{
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<bool> signup(String email, String pass) async {
    try{
      final result = await auth.createUserWithEmailAndPassword(email: email, password: pass);
      if(result.user != null) return true;
      return false;
    }catch(e){
      return false;
    }
  }

  Future<bool> signin(String email, String pass) async {
    try{
      final result = await auth.signInWithEmailAndPassword(email: email, password: pass);
      if(result.user != null) return true;
      return false;
    }catch(e){
      return false;
    }
  }

  Future googleSignIn() async{
    GoogleSignInAccount signInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication authentication = await signInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );
    await auth.signInWithCredential(authCredential);
  }


  Future signOut() async {
    try{
      return auth.signOut();
    }catch(e){
      return null;
    }
  }

//Google Sign in Method
//   Future<UserCredential> googleSignIn() async {
//     final GoogleSignInAccount googleSignInAccount =
//         await googleSignInstance.signIn();
//
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//
//     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);
//
//     return await _auth.signInWithCredential(credential);
//   }

//Function SignUp with email
//   Future<UserCredential> signUp({String email, String password}) async {
//     UserCredential userCredential;
//     try {
//       userCredential = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'email-already-in-use')
//         print('the account already exists for the email.');
//     } catch (e) {
//       print(e);
//     }
//     return Future.value(userCredential);
//   }

  // Future<UserCredential> login({String email, String password}) async {
  //   UserCredential userCredential;
  //   try {
  //     userCredential = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  //   return Future.value(userCredential);
  // }

  // Sign Out
//   Future<void> signOutUser() async {
//     User user = _auth.currentUser;
//     if (user.providerData[1].providerId == 'google.com') {
//       await googleSignInstance.disconnect();
//     }
//     await _auth.signOut();
//   }
}
