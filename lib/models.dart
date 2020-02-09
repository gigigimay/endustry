import 'package:endustry/export.dart';

class Service {
  final String id, name, description, image, url, depId;
  const Service(
      {@required this.id,
      @required this.name,
      this.description,
      this.image,
      this.url,
      this.depId});
}

class News {
  final String id, title, content, imgurl, date, author, typeId;
  const News(
      {@required this.id,
      @required this.title,
      this.content,
      this.imgurl,
      this.date,
      this.author,
      this.typeId});

  static getDateTimeString(datetime) {
    final dateData = DateTime.parse(datetime);
    return '${dateData.day}.${dateData.month}.${dateData.year} | ${dateData.hour}.${dateData.minute} น.';
  }
}

class NewsType {
  final String id, typeName;
  const NewsType({@required this.id, this.typeName});
}

<<<<<<< HEAD
class User {
  String id, firstName, lastName, email, imgUrl, typeId;
  User(
      {@required this.id,
      @required this.email,
      this.firstName,
      this.lastName,
      this.imgUrl,
      this.typeId});
}

class UserType {
  final String id, name;
  const UserType({
    @required this.id,
    @required this.name,
  });
}

=======
>>>>>>> 10ed6e64e56bbf6cc2d876a0aa03b0b5d500d570
class Knowledge {
  final id, title, content, attachurl, date, author, fav;
  const Knowledge(
      {@required this.id,
      @required this.title,
      this.content,
      this.attachurl,
      this.date,
      this.author,
      this.fav});
}
