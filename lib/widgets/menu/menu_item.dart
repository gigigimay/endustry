import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key key,
      @required this.icon,
      @required this.text,
      @required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CONSTANT.SIZE_MD, horizontal: CONSTANT.SIZE_XL),
          child: Row(children: <Widget>[
            Icon(
              icon,
              color: CONSTANT.COLOR_PRIMARY,
              size: CONSTANT.SIZE_XX,
            ),
            SizedBox(width: CONSTANT.SIZE_LG),
            Text(
              text,
              style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
            )
          ]),
        ),
      ),
    );
  }
}
