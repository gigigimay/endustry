import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.icon,
    this.iconWidget,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final IconData icon;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    Widget renderIcon = iconWidget ??
        Icon(
          icon,
          color: CONSTANT.COLOR_PRIMARY,
          size: CONSTANT.SIZE_XX,
        );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CONSTANT.SIZE_MD, horizontal: CONSTANT.SIZE_XL),
          child: Row(children: <Widget>[
            renderIcon,
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
