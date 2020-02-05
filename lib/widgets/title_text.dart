import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class TitleText extends StatelessWidget {
  TitleText(this.title, {Key key, this.fontSize = CONSTANT.FONT_SIZE_TITLE, this.height = 1.0})
      : super(key: key);
  final title, fontSize, height;
  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: this.fontSize,
          fontWeight: FontWeight.w700,
          height: this.height),
    );
  }
}
