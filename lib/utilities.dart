import 'package:endustry/export.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void navigatePush(BuildContext context, Widget page,
      {animate = false}) {
    if (animate)
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    else
      Navigator.push(
          context, NoAnimationMaterialPageRoute(builder: (context) => page));
  }

  static void navigatePushAndPopAll(BuildContext context, Widget page,
      {animate = false}) {
    if (animate)
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> r) => false,
      );
    else
      Navigator.pushAndRemoveUntil(
        context,
        NoAnimationMaterialPageRoute(builder: (context) => page),
        (Route<dynamic> r) => false,
      );
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
