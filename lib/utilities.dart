import 'package:endustry/export.dart';

class Utils {
  static void navigatePush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
