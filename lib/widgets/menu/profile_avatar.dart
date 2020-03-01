import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key key,
    @required this.img,
    @required this.avatarSize,
    @required this.fabSize,
    @required this.fabIcon,
    this.fabAction,
  }) : super(key: key);

  final String img;
  final double avatarSize;
  final double fabSize;
  final Function fabAction;
  final Widget fabIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      CircleFadeInImage(
          size: avatarSize,
          borderColor: CONSTANT.COLOR_BORDER_LIGHT,
          imageUrl: img,
          placeholderImage: CircleAvatar(
            radius: avatarSize / 2,
            child: Image.asset('assets/images/select_profile_pic.png'),
            backgroundColor: Colors.white,
          )),
      Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          width: fabSize,
          height: fabSize,
          child: FittedBox(
            child: FloatingActionButton(
                onPressed: fabAction,
                backgroundColor: CONSTANT.COLOR_PRIMARY,
                elevation: 0,
                child: Transform.scale(scale: 1.2, child: fabIcon)),
          ),
        ),
      )
    ]);
  }
}
