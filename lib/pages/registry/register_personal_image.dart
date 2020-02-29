import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/registry/register_layout.dart';
import 'package:endustry/widgets/menu/profile_avatar.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage2 extends StatefulWidget {
  RegisterPage2(
      {Key key, this.initData, this.nextBtnFuntion, this.prevBtnFuntion})
      : super(key: key);

  final Function prevBtnFuntion, nextBtnFuntion;
  final initData;

  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  bool _valid;

  File _file;
  Uint8List _imgByteCode = kTransparentImage;

  Future getImageByCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);

    print(image.runtimeType);
  }

// take a photo? can but cant both in one btn
  Future getImageByGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _file = image;

    if (_file != null) {
      _imgByteCode = convertFileToByteCode(_file);
      setState(() {
        _valid = true;
      });
    }
  }

  convertFileToByteCode(file) {
    List<int> imageBytes = file.readAsBytesSync();
    return imageBytes;
  }

  convertByteCodeToString(imageBytes) {
    String imageStr = base64Encode(imageBytes);
    return imageStr;
  }

  convertStringToByteCode(str) {
    Uint8List imageBytes = base64Decode(str);
    return imageBytes;
  }

  @override
  void initState() {
    super.initState();
    bool _isPickImage = widget.initData['img'] != '';
    _valid = _isPickImage;
    _imgByteCode = _isPickImage
        ? convertStringToByteCode(widget.initData['img'])
        : kTransparentImage;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double avatarSize = width * 0.5;
    return RegisterLayout(
      registerStep: 1,
      stateTitle: 'เลือกรูปโปรไฟล์',
      prevBtnFuntion: widget.prevBtnFuntion,
      nextBtnFuntion: () =>
          widget.nextBtnFuntion(convertByteCodeToString(_imgByteCode)),
      nextText: _valid ? 'ต่อไป' : 'ข้าม',
      child: SizedBox(
        width: width,
        child: Column(
          children: <Widget>[
            ProfileAvatar(
              img: MemoryImage(_imgByteCode),
              avatarSize: avatarSize,
              fabSize: avatarSize * 0.3,
              fabIcon: Icon(
                Icons.camera_alt,
                size: CONSTANT.SIZE_XL,
              ),
              fabAction: () {
                getImageByGallery();
              },
            ),
          ],
        ),
      ),
    );
  }
}
