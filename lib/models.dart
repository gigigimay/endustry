import 'package:endustry/export.dart';
import 'dart:convert';

class Service {
  final String id, name, description, image, url, depId;
  final List tag;
  final Department departmentData;
  const Service({
    @required this.id,
    @required this.name,
    this.description,
    this.image,
    this.url,
    this.depId,
    this.tag,
    this.departmentData,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        url: json["url"],
        depId: json["depId"],
      );

  factory Service.joinDep(Service service, Department department) => Service(
        id: service.id,
        name: service.name,
        description: service.description,
        image: service.image,
        url: service.url,
        depId: service.depId,
        tag: service.tag,
        departmentData: department,
      );
}

class News {
  final String id, title, content, imgurl, date, author, typeId, bannerImage;
  final List<String> tag;
  const News({
    @required this.id,
    @required this.title,
    this.content,
    this.imgurl,
    this.date,
    this.author,
    this.typeId,
    this.tag,
    this.bannerImage,
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

  getDateTimeString() => Utils.formatDateTime(date);
  getDateString() => Utils.formatDateTime(date).substring(0, 10);
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
    String pass,
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
      password: pass ?? oldUser.password,
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
  final String id, title, content, attachUrl, date, author;
  final List tag;
  const Knowledge({
    @required this.id,
    @required this.title,
    this.content,
    this.attachUrl,
    this.date,
    this.author,
    this.tag,
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

class ServiceHistory {
  final String userId, serviceId;
  final DateTime datetime;
  const ServiceHistory({
    @required this.userId,
    @required this.serviceId,
    @required this.datetime,
  });

  factory ServiceHistory.fromJson(Map<String, dynamic> json) {
    final DateTime dateTime = DateTime.parse(json['datetime']);
    return ServiceHistory(
      userId: json['userId'],
      serviceId: json['serviceId'],
      datetime: dateTime,
    );
  }
}
