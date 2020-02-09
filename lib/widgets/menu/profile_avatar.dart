import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key key,
    @required this.imgUrl,
    @required this.avatarSize,
    @required this.fabSize,
    @required this.fabIcon,
    this.fabAction,
  }) : super(key: key);

  final String imgUrl;
  final double avatarSize;
  final double fabSize;
  final Function fabAction;
  final Widget fabIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: avatarSize,
        height: avatarSize,
        decoration: BoxDecoration(
            border: Border.all(
                color: CONSTANT.COLOR_BORDER_LIGHT,
                width: CONSTANT.BORDER_WIDTH_THICK),
            borderRadius: BorderRadius.circular(999)),
        child: CircleAvatar(radius: 999, backgroundImage: NetworkImage(imgUrl)),
      ),
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
