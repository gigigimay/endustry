import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endustry/export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  Future<FirebaseUser> _handleSignIn(email, password) async {
    final AuthCredential credential = EmailAuthProvider.getCredential(
      email: email,
      password: password,
    );

    user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.email);
    return user;
  }

  login(email, password) async {
    User user = await _handleSignIn(email, password).then((FirebaseUser user) {
      return Firestore.instance
          .collection('users')
          .document(user.uid)
          .get()
          .then((DocumentSnapshot ds) {
        return User(
            id: user.uid,
            email: ds['email'],
            password: ds['password'],
            firstName: ds['firstName'],
            lastName: ds['lastName'],
            img: Utils.convertByteCodeToString(kTransparentImage),
            typeId: ds['typeId'],
            interestedTopics: List<String>.from(ds['interestedTopics']),
            favKnowledges: List<String>.from(ds['favKnowledges']));
      });
    }).catchError((e) => print(e));

    print(user.email);
    print(user.firstName);
    return user;
  }

  register(User newUserData, String password) async {
    user = (await _auth.createUserWithEmailAndPassword(
      email: newUserData.email,
      password: password,
    ))
        .user;

    Firestore.instance.collection('users').document(user.uid).setData({
      'email': user.email,
      'firstName': newUserData.firstName,
      'lastName': newUserData.lastName,
      // 'img': newUserData.img,
      'typeId': newUserData.typeId,
      'interestedTopics': newUserData.interestedTopics,
      'favKnowledges': [],
    });
  }
}
