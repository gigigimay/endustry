import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class IconButtonInk extends StatelessWidget {
  const IconButtonInk({
    Key key,
    @required this.onTap,
    @required this.icon,
    this.size = CONSTANT.SIZE_XX,
    this.padding = const EdgeInsets.all(CONSTANT.SIZE_SM),
    this.color
  }) : super(key: key);

  final Function onTap;
  final IconData icon;
  final double size;
  final EdgeInsets padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: Icon(icon, size: size, color: color,),
        ),
      ),
    );
  }
}
