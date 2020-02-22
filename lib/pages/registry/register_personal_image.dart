import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/registry/register_layout.dart';
import 'package:endustry/widgets/menu/profile_avatar.dart';

class RegisterPage2 extends StatefulWidget {
  RegisterPage2({Key key, this.nextBtnFuntion, this.prevBtnFuntion})
      : super(key: key);

  final Function prevBtnFuntion, nextBtnFuntion;

  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  var imgUrl;
  bool _valid;

  setValid(bool boolean) {
    setState(() {
      _valid = boolean;
    });
  }

  @override
  void initState() {
    super.initState();
    imgUrl = null;
    _valid = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double avatarSize = width * 0.5;
    return RegisterLayout(
      registerStep: 1,
      stateTitle: 'เลือกรูปโปรไฟล์',
      prevBtnFuntion: widget.prevBtnFuntion,
      nextBtnFuntion: widget.nextBtnFuntion,
      nextText: _valid ? 'ต่อไป' : 'ข้าม',
      child: SizedBox(
        width: width,
        child: Column(
          children: <Widget>[
            ProfileAvatar(
              imgUrl: imgUrl,
              avatarSize: avatarSize,
              fabSize: avatarSize * 0.3,
              fabIcon: Icon(
                Icons.camera_alt,
                size: CONSTANT.SIZE_XL,
              ),
              fabAction: () {
                setState(() {
                  //TODO: pick image or take a shot now
                  imgUrl = MOCK_USER.imgUrl;
                  setValid(true);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
