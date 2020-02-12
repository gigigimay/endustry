import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class TopicBtn extends StatelessWidget {
  const TopicBtn({Key key, this.text, this.style, this.onPressed})
      : super(key: key);
  final text;
  final style;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
        child: Text(text, style: style),
        onPressed: onPressed);
  }
}
