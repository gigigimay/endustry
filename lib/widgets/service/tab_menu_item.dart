import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class TabMenuItem extends StatelessWidget {
  const TabMenuItem({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.only(
          top: CONSTANT.SIZE_SM,
          bottom: CONSTANT.SIZE_XL,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CONSTANT.BORDER_RADIUS),
            topRight: Radius.circular(CONSTANT.BORDER_RADIUS),
          ),
        ),
        onPressed: () => print('pressed! > $text'),
        child: Text(
          text,
          style: TextStyle(
            fontSize: CONSTANT.FONT_SIZE_HEAD,
            color: isSelected ? CONSTANT.COLOR_BODY : CONSTANT.COLOR_DISABLED,
          ),
        ),
        color: isSelected ? Colors.white : null,
      ),
    );
  }
}
