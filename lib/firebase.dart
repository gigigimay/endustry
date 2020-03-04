import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endustry/export.dart';
import 'package:endustry/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class FirebaseDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseUser user;

  Future<FirebaseUser> handleSignIn(email, password) async {
    final AuthCredential credential = EmailAuthProvider.getCredential(
      email: email,
      password: password,
    );
    try {
      user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.email);
      return user;
    } catch (e) {
      return null;
    }
  }

  login(email, password) async {
    try {
      user = await handleSignIn(email, password);
      return await getUserData(user.uid);
    } catch (e) {}
  }

  Future<User> getUserData(uid) async {
    User currentUser = await Firestore.instance
        .collection('users')
        .document(uid)
        .get()
        .then((DocumentSnapshot ds) {
      return User(
          id: uid,
          email: ds['email'],
          password: ds['password'],
          firstName: ds['firstName'],
          lastName: ds['lastName'],
          img: ds['img'],
          typeId: ds['typeId'],
          interestedTopics: List<String>.from(ds['interestedTopics']),
          favKnowledges: List<String>.from(ds['favKnowledges']));
    });
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
      'typeId': newUserData.typeId,
      'interestedTopics': newUserData.interestedTopics,
      'favKnowledges': [],
    });

    await addImageToStorage(base64Decode(newUserData.img), user.uid);
  }

  Future<String> addImageToStorage(Uint8List imageData, uid) async {
    String imgID = Uuid().v4();
    await FirebaseStorage.instance
        .ref()
        .child(imgID)
        .putData(imageData)
        .onComplete;

    String url =
        await FirebaseStorage.instance.ref().child(imgID).getDownloadURL();

    await Firestore.instance.collection('users').document(uid).updateData({
      'img': url,
    }).catchError((e) => print(e));

    print(url);
    return url;
  }

  editUserProfile(User oldUser, User updatedUserData) async {
    await Firestore.instance.collection('users').document(user.uid).updateData({
      'firstName': updatedUserData.firstName ?? '',
      'lastName': updatedUserData.lastName ?? '',
      'email': updatedUserData.email ?? '',
      'typeId': updatedUserData.typeId ?? '',
      'img': updatedUserData.img ?? ''
    }).catchError((e) => print(e));

    await handleSignIn(oldUser.email, oldUser.password);
    await user.updateEmail(updatedUserData.email);

    Storage.user = await getUserData(user.uid);
  }

  editUserPassword(String newPassword) async {
    await user.updatePassword(newPassword);
  }

  editUserKeyword(List<String> value) async {
    await Firestore.instance.collection('users').document(user.uid).updateData({
      'interestedTopics': value ?? [],
    }).catchError((e) => print(e));
  }

  updateUserFav(List<String> value) async {
    await Firestore.instance.collection('users').document(user.uid).updateData({
      'favKnowledges': value ?? [],
    }).catchError((e) => print(e));
  }

  updateImageToStorage(Uint8List imageData, uid) async {
    String imgID = await Firestore.instance
        .collection('users')
        .document(uid)
        .get()
        .then((DocumentSnapshot ds) {
      return (basename(ds['img'])
          .substring(0, basename(ds['img']).indexOf('?')));
    });

    await FirebaseStorage.instance
        .ref()
        .child(imgID)
        .putData(imageData)
        .onComplete;
  }
}
