import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endustry/export.dart';
import 'package:endustry/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseUser user;

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
    user = await _handleSignIn(email, password).catchError((e) => print(e));

    return await getUserData();
  }

  Future<User> getUserData() async {
    User currentUser = await Firestore.instance
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

    print(currentUser.email);
    print(currentUser.password);
    return currentUser;
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }

  register(User newUserData, String password) async {
    user = (await _auth.createUserWithEmailAndPassword(
      email: newUserData.email,
      password: password,
    ))
        .user;

    await Firestore.instance.collection('users').document(user.uid).setData({
      'email': user.email,
      'password': password,
      'firstName': newUserData.firstName,
      'lastName': newUserData.lastName,
      // 'img': newUserData.img,
      'typeId': newUserData.typeId,
      'interestedTopics': newUserData.interestedTopics,
      'favKnowledges': [],
    });
  }

  editUserProfile(User updatedUserData) async {
    await Firestore.instance.collection('users').document(user.uid).updateData({
      'firstName': updatedUserData.firstName ?? '',
      'lastName': updatedUserData.lastName ?? '',
      'email': updatedUserData.email ?? '',
      'typeId': updatedUserData.typeId ?? '',
      // 'img': updatedUserData.img ?? ''
    }).catchError((e) => print(e));

    await user.updateEmail(updatedUserData.email);

    Storage.user = await getUserData();
  }

  editUserPassword(String newPassword) async {
    await user.updatePassword(newPassword);
  }

  editUserKeyword(List<String> value) async {
    await Firestore.instance.collection('users').document(user.uid).updateData({
      'interestedTopics': value ?? [],
    }).catchError((e) => print(e));
  }
}
