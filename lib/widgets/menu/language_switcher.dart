import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget item(String text, bool active) => Container(
          decoration: BoxDecoration(
            color: active ? Colors.purple[50] : null,
            borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
            border: active
                ? Border.all(
                    color: CONSTANT.COLOR_PRIMARY,
                    width: CONSTANT.BORDER_WIDTH_MEDIUM)
                : null,
          ),
          padding: EdgeInsets.symmetric(
              vertical: CONSTANT.SIZE_SM, horizontal: CONSTANT.SIZE_MD),
          child: Text(
            text,
            style: active
                ? CONSTANT.TEXT_STYLE_BODY_PRIMARY
                : TextStyle(color: CONSTANT.COLOR_PRIMARY),
          ),
        );
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
              border: Border.all(color: CONSTANT.COLOR_PRIMARY),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            item('TH', true),
            item('EN', false),
          ],
        ),
      ],
    );
  }
}
