import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required this.onPressed,
    this.text,
    this.child,
    this.width,
    this.height,
    this.disabled = false,
    this.colors = const [
      CONSTANT.COLOR_PRIMARY,
      CONSTANT.COLOR_SECONDARY,
    ],
    this.disabledColors = const [
      CONSTANT.COLOR_BORDER_LIGHT,
      CONSTANT.COLOR_DISABLED,
    ],
    this.borderRadius = 999.0,
    this.padding = const EdgeInsets.symmetric(
      vertical: CONSTANT.SIZE_SM,
      horizontal: CONSTANT.SIZE_XX,
    ),
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.topRight,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final Widget child;
  final bool disabled;
  final List<Color> colors, disabledColors;
  final double borderRadius, width, height;
  final EdgeInsetsGeometry padding;
  final Alignment gradientBegin, gradientEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: disabled ? disabledColors : colors,
          begin: gradientBegin,
          end: gradientEnd,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: disabled ? null : onPressed,
          child: Container(
            padding: padding,
            child: child ??
                Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: CONSTANT.FONT_SIZE_HEAD,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
