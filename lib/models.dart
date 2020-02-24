import 'package:endustry/export.dart';

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
  final String id, firstName, lastName, email, imgUrl, typeId;
  final List<String> favKnowledges, interestedTopics;

  const User({
    @required this.id,
    @required this.email,
    this.firstName,
    this.lastName,
    this.imgUrl,
    this.typeId,
    this.favKnowledges,
    this.interestedTopics,
  });
}

class UserType {
  final String id, name;
  const UserType({
    @required this.id,
    @required this.name,
  });
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
