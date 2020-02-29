import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class AlertBox extends StatelessWidget {
  const AlertBox({
    Key key,
    @required this.text,
    this.textColor,
    this.bgColor,
    this.icon,
  }) : super(key: key);
  final String text;
  final Color textColor, bgColor;
  final IconData icon;

  const AlertBox.success({
    Key key,
    @required this.text,
    this.textColor = const Color(0xFF337744),
    this.bgColor = const Color(0xFFF0F5D8),
    this.icon = Icons.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      margin: EdgeInsets.only(bottom: CONSTANT.SIZE_SM),
      padding: EdgeInsets.symmetric(
          vertical: CONSTANT.SIZE_XS, horizontal: CONSTANT.SIZE_MD),
      color: bgColor,
      child: Row(
        children: <Widget>[
          icon != null
              ? Container(
                  margin: EdgeInsets.only(right: CONSTANT.SIZE_SM),
                  child: Icon(
                    icon,
                    color: textColor,
                    size: CONSTANT.FONT_SIZE_BODY,
                  ),
                )
              : Container(),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
