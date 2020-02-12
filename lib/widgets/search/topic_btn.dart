import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class TopicBtn extends StatelessWidget {
  const TopicBtn({
    Key key,
    this.text,
    this.isActive,
    this.onChange,
  }) : super(key: key);

  final String text;
  final bool isActive;
  final Function onChange;

  void onPressed() {
    onChange(text);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
      ),
      child: Text(
        text,
        style: isActive
            ? CONSTANT.TEXT_STYLE_BODY_PRIMARY
            : TextStyle(fontWeight: FontWeight.w300),
      ),
    );
  }
}
