import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class IconButtonInk extends StatelessWidget {
  const IconButtonInk({
    Key key,
    @required this.onPressed,
    @required this.icon,
    this.padding = const EdgeInsets.all(CONSTANT.SIZE_SM),
  }) : super(key: key);

  final Function onPressed;
  final Widget icon;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: icon,
        ),
      ),
    );
  }
}
