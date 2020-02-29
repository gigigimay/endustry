import 'package:endustry/export.dart';
import 'dart:convert';

class Service {
  final String id, name, description, image, url, depId;
  const Service({
    @required this.id,
    @required this.name,
    this.description,
    this.image,
    this.url,
    this.depId,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        url: json["url"],
        depId: json["depId"],
      );
}

class News {
  final String id, title, content, imgurl, date, author, typeId;
  const News({
    @required this.id,
    @required this.title,
    this.content,
    this.imgurl,
    this.date,
    this.author,
    this.typeId,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imgurl: json["imgurl"],
        date: json["date"],
        author: json["author"],
        typeId: json["typeId"],
      );

  static getDateTimeString(datetime) {
    final dateData = DateTime.parse(datetime);
    return '${dateData.day}.${dateData.month}.${dateData.year} | ${dateData.hour}.${dateData.minute} น.';
  }

  static getDateString(datetime) {
    final dateData = DateTime.parse(datetime);
    return '${dateData.day}.${dateData.month}.${dateData.year}';
  }
}

class NewsType {
  final String id, typeName;
  const NewsType({@required this.id, this.typeName});

  factory NewsType.fromJson(Map<String, dynamic> json) => NewsType(
        id: json["id"],
        typeName: json["typeName"],
      );
}

class User {
  final String id, firstName, lastName, email, img, typeId, password;
  final List<String> favKnowledges, interestedTopics;

  const User({
    @required this.id,
    @required this.email,
    this.firstName,
    this.lastName,
    this.img,
    this.typeId,
    this.favKnowledges,
    this.interestedTopics,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> jsondata) {
    final List<String> favKnowledgesData =
        List<String>.from(json.decode(jsondata['favKnowledges']));
    final List<String> interestedTopics =
        List<String>.from(json.decode(jsondata['interestedTopics']));
    return User(
      id: jsondata['id'],
      email: jsondata['email'],
      password: jsondata['password'],
      firstName: jsondata['firstName'],
      lastName: jsondata['lastName'],
      img: jsondata['img'],
      typeId: jsondata['typeId'],
      favKnowledges: favKnowledgesData,
      interestedTopics: interestedTopics,
    );
  }

  factory User.fromUser(
    User oldUser, {
    @required String email,
    String firstName,
    String lastName,
    String img,
    String typeId,
    List<String> favKnowledges,
    List<String> interestedTopics,
  }) {
    return User(
      id: oldUser.id,
      email: email ?? oldUser.email,
      firstName: firstName ?? oldUser.firstName,
      lastName: lastName ?? oldUser.lastName,
      img: img ?? oldUser.img,
      typeId: typeId ?? oldUser.typeId,
      favKnowledges: favKnowledges ?? oldUser.favKnowledges,
      interestedTopics: interestedTopics ?? oldUser.interestedTopics,
    );
  }
}

class UserType {
  final String id, name;
  const UserType({
    @required this.id,
    @required this.name,
  });

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
        id: json["id"],
        name: json["name"],
      );
}

class Knowledge {
  final id, title, content, attachUrl, date, author;
  const Knowledge({
    @required this.id,
    @required this.title,
    this.content,
    this.attachUrl,
    this.date,
    this.author,
  });

  factory Knowledge.fromJson(Map<String, dynamic> json) => Knowledge(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        attachUrl: json["imgurl"],
        date: json["date"],
        author: json["author"],
      );
}

class Keyword {
  final String id, name;
  const Keyword({
    @required this.id,
    @required this.name,
  });

  factory Keyword.fromJson(Map<String, dynamic> json) => Keyword(
        id: json["id"],
        name: json["name"],
      );
}

class Department {
  final String id, name, description, image, url;
  const Department({
    @required this.id,
    @required this.name,
    this.description,
    this.image,
    this.url,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        url: json["url"],
      );
}
