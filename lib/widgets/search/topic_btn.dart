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
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: width * 0.04,
            color: isActive ? CONSTANT.COLOR_PRIMARY : CONSTANT.COLOR_BODY,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
