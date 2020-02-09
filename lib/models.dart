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

  static getDateTimeString(datetime) {
    final dateData = DateTime.parse(datetime);
    return '${dateData.day}.${dateData.month}.${dateData.year} | ${dateData.hour}.${dateData.minute} น.';
  }
}

class NewsType {
  final String id, typeName;
  const NewsType({@required this.id, this.typeName});
}

class User {
  String id, firstName, lastName, email, imgUrl, typeId;
  List<String> favKnowledges, interestedTopics;

  User({
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
}

class Keyword {
  final String id, name;
  const Keyword({
    @required this.id,
    @required this.name,
  });
}
