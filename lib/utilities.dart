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
    if (animate) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    } else {
      Navigator.push(
          context, NoAnimationMaterialPageRoute(builder: (context) => page));
    }
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

  static void navigatePushReplacement(BuildContext context, Widget page,
      {animate = false}) {
    if (animate)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => page));
    else
      Navigator.pushReplacement(
          context, NoAnimationMaterialPageRoute(builder: (context) => page));
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

  // open camera function
  // static Future getImageByCamera() async {
  //   File image = await ImagePicker.pickImage(source: ImageSource.camera);
  // }

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
    String userTypeKeywordId =
        MOCK_KEYWORDS.firstWhere((item) => item.name == Storage.user.typeId).id;
    Map<String, int> _suggsetTier = {};
    final _userKey = Set.from([Storage.user.interestedTopics, userTypeKeywordId]);
    list.forEach((item) {
      var intersec = Set.from(item.tag).intersection(_userKey);
      if (intersec.length > 0) {
        _suggsetTier['${item.id}'] = intersec.length;
      }
    });
    List _suggsetTierAsc = _suggsetTier.keys.toList()
      ..sort((i1, i2) => _suggsetTier[i1].compareTo(_suggsetTier[i2]));
    List _suggsetTierDesc = _suggsetTierAsc.reversed.toList();

    // create list of suggest item
    List _suggestList = [];
    _suggsetTierDesc.forEach((sugKey) =>
        _suggestList.add(list.firstWhere((item) => sugKey == item.id)));

    return _suggestList;
  }

  static padNumber(value, {length = 2}) =>
      value.toString().padLeft(length, '0');

  static String formatDateTime(datetime) {
    final dateData = DateTime.parse(datetime);
    final String day = padNumber(dateData.day);
    final String month = padNumber(dateData.month);
    // this is a temporary fix, we should change all the data to B.E. year instead.
    final int localYear = dateData.year + (dateData.year > 2100 ? 0 : 543);
    final String year = padNumber(localYear, length: 4);
    final String hour = padNumber(dateData.hour);
    final String minute = padNumber(dateData.minute);
    return '$day.$month.$year | $hour.$minute น.';
  }

  static List<Service> joinServiceDep(
    List<Service> services,
    List<Department> departments,
  ) =>
      services
          .map((Service s) => Service.joinDep(
              s, departments.firstWhere((Department d) => d.id == s.depId)))
          .toList();
}
