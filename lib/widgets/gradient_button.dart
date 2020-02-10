import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.child,
    this.disabled = false,
    this.colors = const [CONSTANT.COLOR_PRIMARY, CONSTANT.COLOR_SECONDARY],
    this.disabledColors = const [
      CONSTANT.COLOR_BORDER_LIGHT,
      CONSTANT.COLOR_DISABLED,
    ],
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final Widget child;
  final bool disabled;
  final List<Color> colors, disabledColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        gradient: LinearGradient(
          colors: disabled ? disabledColors : colors,
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: disabled ? null : onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: CONSTANT.SIZE_SM, horizontal: CONSTANT.SIZE_XX),
            child: child ??
                Text(
                  text,
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
