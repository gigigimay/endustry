import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/menu/profile_avatar.dart';

class RegisterPage2 extends StatefulWidget {
  RegisterPage2({Key key, this.onPressed}) : super(key: key);

  final onPressed;

  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  var imgUrl;

  @override
  void initState() {
    super.initState();
    //TODO: get initial image?
    imgUrl = null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double avatarSize = width * 0.5;
    return SizedBox(
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
                widget.onPressed(true);
              });
            },
          ),
        ],
      ),
    );
  }
}
