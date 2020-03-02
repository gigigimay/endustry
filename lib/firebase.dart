// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FirebaseDB {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseUser user;

//   Future<FirebaseUser> _handleSignIn() async {
//     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     user = (await _auth.signInWithCredential(credential)).user;
//     print("signed in " + user.displayName);
//     return user;
//   }

//   login() {
//     _handleSignIn()
//         .then((FirebaseUser user) => print(user))
//         .catchError((e) => print(e));
//   }

//   register() async {
//     user = (await _auth.createUserWithEmailAndPassword(
//       email: 'an email',
//       password: 'a password',
//     ))
//         .user;
//   }
// }
