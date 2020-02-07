import 'package:endustry/export.dart';

class Service {
  final id, name, description, image, url, depId;
  const Service(
      {@required this.id,
      @required this.name,
      this.description,
      this.image,
      this.url,
      this.depId});
}

class News {
  final id, title, content, imgurl, date, author, typeId;
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
