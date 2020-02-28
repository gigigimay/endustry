import 'dart:io';
import 'dart:typed_data';

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
    loadDB();
  }

  loadDB() async {
    services = await getServices();
    department = await getDepartments();
    news = await getNews();
    newsTypes = await getNewsTypes();
    knowledges = await getKnowledges();
    keywords = await getKeywords();
  }

  createTable() async {
    db.execute(
        'CREATE TABLE Services (id String PRIMARY KEY, name TEXT,description TEXT,url TEXT,image TEXT,depId TEXT);');
    db.execute(
        'CREATE TABLE Departments (id String PRIMARY KEY, name TEXT,description TEXT,url TEXT,image TEXT);');
    db.execute(
        'CREATE TABLE News (id String PRIMARY KEY, title TEXT,content TEXT,date Date,author TEXT,imgurl TEXT,typeId TEXT);');
    db.execute(
        'CREATE TABLE NewsTypes (id String PRIMARY KEY, typeName TEXT);');
    db.execute(
        'CREATE TABLE Knowledges (id String PRIMARY KEY, title TEXT,content TEXT,date Date,author TEXT,attachUrl TEXT);');
    db.execute('CREATE TABLE Keywords (id String PRIMARY KEY, name TEXT);');
  }

  closeDB() async {
    await db.close();
  }

  getServices() async {
    List<Service> list = [];
    await db.rawQuery('SELECT * FROM Services').then((data) {
      data.forEach((item) => list.add(Service.fromJson(item)));
    });
    print(list);
    return list;
  }

  getDepartments() async {
    List<Department> list = [];
    await db.rawQuery('SELECT * FROM Departments').then((data) {
      data.forEach((item) => list.add(Department.fromJson(item)));
    });
    print(list);
    return list;
  }

  getNews() async {
    List<News> list = [];
    await db.rawQuery('SELECT * FROM News').then((data) {
      data.forEach((item) => list.add(News.fromJson(item)));
    });
    print(list);
    return list;
  }

  getNewsTypes() async {
    List<NewsType> list = [];
    await db.rawQuery('SELECT * FROM NewsTypes').then((data) {
      data.forEach((item) => list.add(NewsType.fromJson(item)));
    });
    print(list);
    return list;
  }

  getKnowledges() async {
    List<Knowledge> list = [];
    await db.rawQuery('SELECT * FROM Knowledges').then((data) {
      data.forEach((item) => list.add(Knowledge.fromJson(item)));
    });
    print(list);
    return list;
  }

  getKeywords() async {
    List<Keyword> list = [];
    await db.rawQuery('SELECT * FROM Keywords').then((data) {
      data.forEach((item) => list.add(Keyword.fromJson(item)));
    });
    print(list);
    return list;
  }
}
