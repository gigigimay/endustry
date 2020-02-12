import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class CircleFadeInImage extends StatelessWidget {
  const CircleFadeInImage({
    Key key,
    @required this.size,
    @required this.imageUrl,
    this.borderColor = CONSTANT.COLOR_PRIMARY,
    this.borderWidth = CONSTANT.BORDER_WIDTH_THICK,
    this.bgColor = Colors.white,
  }) : super(key: key);

  final double size, borderWidth;
  final String imageUrl;
  final Color borderColor, bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        color: bgColor,
        shape: CircleBorder(
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      child: imageUrl != null
          ? ClipOval(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUrl,
              ),
            )
          : Container(),
    );
  }
}
