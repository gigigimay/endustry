import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required this.onTap,
    @required this.text,
    this.child,
    this.colors = const [CONSTANT.COLOR_PRIMARY, CONSTANT.COLOR_SECONDARY],
  }) : super(key: key);

  final Function onTap;
  final String text;
  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: CONSTANT.SIZE_SM, horizontal: CONSTANT.SIZE_XX),
            child: child ??
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: CONSTANT.FONT_SIZE_HEAD,
                      color: Colors.white),
                ),
          ),
        ),
      ),
    );
  }
}
