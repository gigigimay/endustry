import 'package:endustry/export.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void navigatePush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void navigatePushAndPopAll(BuildContext context, String pageRoute) {
    Navigator.pushNamedAndRemoveUntil(
        context, pageRoute, (Route<dynamic> route) => false);
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
