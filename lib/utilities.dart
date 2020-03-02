import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:endustry/export.dart';
import 'package:endustry/storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crypto/crypto.dart';

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
  }

  static getImageByGallery() async {
    // take a photo? can but cant both in one btn
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

  static Uint8List convertStringToByteCode(str) {
    Uint8List imageBytes = base64Decode(str);
    return imageBytes;
  }

  static String encode(String text) =>
      md5.convert(utf8.encode(text)).toString();

  static List getSuggestList(List list) {
    // create list of suggest key by tier
    Map<String, int> _suggsetTier = {};
    final _userKey = Set.from(Storage.user.interestedTopics);
    list.forEach((item) {
      var intersec = Set.from(item.tag).intersection(_userKey);
      if (intersec.length > 0) {
        _suggsetTier['${item.id}'] = intersec.length;
      }
    });
    print('sugg: $_suggsetTier');
    List _suggsetTierAsc = _suggsetTier.keys.toList()
      ..sort((i1, i2) => _suggsetTier[i1].compareTo(_suggsetTier[i2]));
    List _suggsetTierDesc = _suggsetTierAsc.reversed.toList();
    print('suggDesc: $_suggsetTierDesc');

    // create list of suggest item
    List _suggestList = [];
    _suggsetTierDesc.forEach((sugKey) =>
        _suggestList.add(list.firstWhere((item) => sugKey == item.id)));

    return _suggestList;
  }
}
