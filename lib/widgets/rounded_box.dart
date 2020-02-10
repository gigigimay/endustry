import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class RoundedBox extends StatelessWidget {
  const RoundedBox(
      {Key key,
      this.width,
      this.height,
      this.child,
      this.margin,
      this.padding,
      this.color = Colors.white})
      : super(key: key);

  final double width, height;
  final Widget child;
  final EdgeInsets margin, padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
        color: color,
      ),
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}
