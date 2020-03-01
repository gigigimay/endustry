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

  Uint8List _imgByteCode = kTransparentImage;

  @override
  void initState() {
    super.initState();
    bool _isPickImage = widget.initData['img'] !=
        Utils.convertByteCodeToString(kTransparentImage);
    _valid = _isPickImage;
    _imgByteCode = _isPickImage
        ? Utils.convertStringToByteCode(widget.initData['img'])
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
          widget.nextBtnFuntion(Utils.convertByteCodeToString(_imgByteCode)),
      nextText: _valid ? 'ต่อไป' : 'ข้าม',
      child: SizedBox(
        width: width,
        child: Column(
          children: <Widget>[
            ProfileAvatar(
              img: MemoryImage(_imgByteCode != kTransparentImage
                  ? _imgByteCode
                  : kTransparentImage),
              avatarSize: avatarSize,
              fabSize: avatarSize * 0.3,
              fabIcon: Icon(
                Icons.camera_alt,
                size: CONSTANT.SIZE_XL,
              ),
              fabAction: () async {
                _imgByteCode = await Utils.getImageByGallery();
                if (_imgByteCode != kTransparentImage) {
                  setState(() {
                    _imgByteCode = _imgByteCode;
                    _valid = true;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
