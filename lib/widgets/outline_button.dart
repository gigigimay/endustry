import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key key,
    @required this.onPressed,
    this.text,
    this.child,
    this.disabled = false,
    this.borderRadius = 999.0,
    this.width,
    this.height,
    this.color = CONSTANT.COLOR_PRIMARY,
    this.padding = const EdgeInsets.symmetric(
      vertical: CONSTANT.SIZE_SM,
      horizontal: CONSTANT.SIZE_XX,
    ),
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final Widget child;
  final bool disabled;
  final double borderRadius, width, height;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlineButton(
        padding: padding,
        onPressed: disabled ? null : onPressed,
        child: child ??
            Text(
              text,
              style: TextStyle(
                color: disabled ? CONSTANT.COLOR_DISABLED : color,
                fontSize: CONSTANT.FONT_SIZE_HEAD,
              ),
            ),
        color: color,
        borderSide: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
