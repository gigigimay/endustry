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

  // TODO: convert these function to firebase function
  //   editUserProfile(User userData) async {
  //   var result = await db.rawQuery('''UPDATE Users
  //       SET
  //         firstName="${userData.firstName}",
  //         lastName="${userData.lastName}",
  //         email="${userData.email}",
  //         typeId="${userData.typeId}",
  //         img="${userData.img ?? ''}"
  //       WHERE id="${userData.id}";''');
  //   print('editUserProfile: ' + result.toString());
  //   user = await getUserDataFromId(userData.id);
  // }

  // editUserPassword(String uid, String newPassword) async {
  //   await db
  //       .rawQuery('UPDATE Users SET password="$newPassword" WHERE id="$uid";');
  //   user = await getUserDataFromId(uid);
  // }

  // editUserKeyword(String uid, List<String> value) async {
  //   await db.rawQuery(
  //       '''UPDATE Users SET interestedTopics='${json.encode(value)}' WHERE id="$uid";''');
  //   user = await getUserDataFromId(uid);
  // }
}
