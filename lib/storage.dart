import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:endustry/export.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

Database db;

class Storage {
  static List<Service> services;
  static List<Department> department;
  static List<News> news;
  static List<NewsType> newsTypes;
  static List<Knowledge> knowledges;
  static List<Keyword> keywords;
  static List<UserType> userType;
  static User user;

  initDB() async {
    // Construct a file path to copy database to
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "asset_database.db");

    // Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      // Load database from asset and copy
      ByteData data = await rootBundle.load(join('assets', 'database.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
    }

    db = await openDatabase(path);
    await loadDB();
  }

  loadDB() async {
    services = await getServices();
    department = await getDepartments();
    news = await getNews();
    newsTypes = await getNewsTypes();
    knowledges = await getKnowledges();
    keywords = await getKeywords();
    userType = await getUsertypes();
  }

  insertNewUser(User newUserData, String password) async {
    db.execute(
        "INSERT INTO USERS (email,password,firstName,lastName,typeId,img,favKnowledges,interestedTopics) " +
            "VALUES ('${newUserData.email}','$password','${newUserData.firstName}','${newUserData.lastName}','${newUserData.typeId}','${newUserData.img}','${json.encode([])}','${json.encode(newUserData.interestedTopics)}')");
  }

  clearUser() async {
    await db.execute("DELETE FROM users");
    db.execute(
        "insert into users VALUES ('user01','nani@mail.com','a','แพร','อ้วนนะ','ust01','https://picsum.photos/200','[]','[]');");
  }

  closeDB() async {
    await db.close();
  }

  getServices() async {
    List<Service> list = [];
    await db.rawQuery('SELECT * FROM Services').then((data) {
      data.forEach((item) => list.add(Service.fromJson(item)));
    });
    print('getServices: ' + list.toString());
    return list;
  }

  getDepartments() async {
    List<Department> list = [];
    await db.rawQuery('SELECT * FROM Departments').then((data) {
      data.forEach((item) => list.add(Department.fromJson(item)));
    });
    print('getDepartments: ' + list.toString());
    return list;
  }

  getNews() async {
    List<News> list = [];
    await db.rawQuery('SELECT * FROM News').then((data) {
      data.forEach((item) => list.add(News.fromJson(item)));
    });
    print('getNews: ' + list.toString());
    return list;
  }

  getNewsTypes() async {
    List<NewsType> list = [];
    await db.rawQuery('SELECT * FROM NewsTypes').then((data) {
      data.forEach((item) => list.add(NewsType.fromJson(item)));
    });
    print('getNewsTypes: ' + list.toString());
    return list;
  }

  getKnowledges() async {
    List<Knowledge> list = [];
    await db.rawQuery('SELECT * FROM Knowledges').then((data) {
      data.forEach((item) => list.add(Knowledge.fromJson(item)));
    });
    print('getKnowledges: ' + list.toString());
    return list;
  }

  getKeywords() async {
    List<Keyword> list = [];
    await db.rawQuery('SELECT * FROM Keywords').then((data) {
      data.forEach((item) => list.add(Keyword.fromJson(item)));
    });
    print('getKeywords: ' + list.toString());
    return list;
  }

  getUsertypes() async {
    List<UserType> list = [];
    await db.rawQuery('SELECT * FROM UserTypes').then((data) {
      data.forEach((item) => list.add(UserType.fromJson(item)));
    });
    print('getUsertypes: ' + list.toString());
    return list;
  }

  /// get userData from user id and return the data
  getUserDataFromId(String uid) async {
    var result = await db.rawQuery('SELECT * FROM Users WHERE id = "$uid";');
    return result.isNotEmpty ? User.fromJson(result.first) : null;
  }

  /// get userData from email and password and return the data
  getUserDataFromEmailPassword(String email, String password) async {
    String encodePassword = md5.convert(utf8.encode(password)).toString();
    var result = await db.rawQuery(
        'SELECT * FROM Users WHERE email = "$email" AND password = "$encodePassword";');
    return result.isNotEmpty ? User.fromJson(result.first) : null;
  }

  /// check if 'uid' exists and return boolean. and also set userData of the storage.
  checkUidPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString('uid');
    if (uid != null) {
      var userData = await getUserDataFromId(uid);
      Storage.user = userData;
      return true;
    }
    return false;
  }

  /// set uid in preference, and set user data variable
  login(User userData) async {
    user = userData;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', userData.id);
  }

  /// remove uid from preference, and clear user data variable
  logout() async {
    user = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('uid');
  }

  editUserProfile(User userData) async {
    // TODO: update interestedTopic
    var result = await db.rawQuery('''UPDATE Users
        SET
          firstName="${userData.firstName}",
          lastName="${userData.lastName}",
          email="${userData.email}",
          typeId="${userData.typeId}",
          img="${userData.img ?? ''}"
        WHERE id="${userData.id}";''');
    print('editUserProfile: ' + result.toString());
    user = await getUserDataFromId(userData.id);
  }

  editUserPassword(String uid, String newPassword) async {
    await db
        .rawQuery('UPDATE Users SET password="$newPassword" WHERE id="$uid";');
    user = await getUserDataFromId(uid);
  }

  editUserKeyword(String uid, List<String> value) async {
    await db.rawQuery(
        '''UPDATE Users SET interestedTopics='${json.encode(value)}' WHERE id="$uid";''');
    user = await getUserDataFromId(uid);
  }
}
