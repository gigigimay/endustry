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
