import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:endustry/export.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
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
      {animate = false, value}) {
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

  static void showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: Color(0x77000000),
      fontSize: 16,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static Future getImageByCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);

    print(image.runtimeType);
  }

// take a photo? can but cant both in one btn
  static getImageByGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image.readAsBytesSync();
    }
    return kTransparentImage;
  }

  static convertByteCodeToString(imageBytes) {
    String imageStr = base64Encode(imageBytes);
    return imageStr;
  }

  static convertStringToByteCode(str) {
    Uint8List imageBytes = base64Decode(str);
    return imageBytes;
  }
}
