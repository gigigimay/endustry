import 'package:endustry/export.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Database db;

  static List<Service> services;
  static List<Department> department;
  static List<News> news;
  static List<NewsType> newsTypes;
  static List<Knowledge> knowledges;
  static List<Keyword> keywords;

  Future openDB() async {
    db = await openDatabase(
      'tst.db',
    );

    // createTable();
    // dropTable();

    // insertData();
    // clearTable();

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

  dropTable() async {
    db.execute('DROP TABLE Services;');
    db.execute('DROP TABLE Departments;');
    db.execute('DROP TABLE News;');
    db.execute('DROP TABLE NewsTypes;');
    db.execute('DROP TABLE Knowledges;');
    db.execute('DROP TABLE Keywords;');
  }

  clearTable() async {
    db.execute('DELETE FROM Services;');
    db.execute('DELETE FROM Departments;');
    db.execute('DELETE FROM News;');
    db.execute('DELETE FROM NewsTypes;');
    db.execute('DELETE FROM Knowledges;');
    db.execute('DELETE FROM Keywords;');
  }

  insertData() {
    insertServices();
    insertDepartments();
    insertNews();
    insertNewsTypes();
    insertKnowledges();
    insertKeywords();
  }

  insertServices() async {
    MOCK_SERVICES.forEach((item) {
      db.execute(
          """INSERT INTO Services VALUES( '${item.id}', '${item.name}', '${item.description}', '${item.url}', '${item.image}', '${item.depId}'); """);
    });
  }

  insertDepartments() async {
    MOCK_DEPARTMENT.forEach((item) {
      db.execute(
          """INSERT INTO Departments VALUES( '${item.id}', '${item.name}', '${item.description}', '${item.url}', '${item.image}'); """);
    });
  }

  insertNews() async {
    MOCK_NEWS.forEach((item) {
      db.execute(
          """INSERT INTO News VALUES( '${item.id}', '${item.title}', '${item.content}', '${item.date}', '${item.author}', '${item.imgurl}', '${item.typeId}'); """);
    });
  }

  insertNewsTypes() async {
    MOCK_NEWSTYPES.forEach((item) {
      db.execute(
          """INSERT INTO NewsTypes VALUES( '${item.id}', '${item.typeName}'); """);
    });
  }

  insertKnowledges() async {
    MOCK_KNOWLEDGES.forEach((item) {
      db.execute(
          """INSERT INTO Knowledges VALUES( '${item.id}', '${item.title}', '${item.content}', '${item.date}', '${item.author}', '${item.attachUrl}'); """);
    });
  }

  insertKeywords() async {
    MOCK_KEYWORDS.forEach((item) {
      db.execute(
          """INSERT INTO Keywords VALUES( '${item.id}', '${item.name}'); """);
    });
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
