import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class CircleFadeInImage extends StatelessWidget {
  const CircleFadeInImage(
      {Key key,
      @required this.size,
      @required this.image,
      this.borderColor = CONSTANT.COLOR_PRIMARY,
      this.borderWidth = CONSTANT.BORDER_WIDTH_THICK,
      this.bgColor = Colors.white,
      this.placeholderImage = const AssetImage('assets/images/pic.png'),})
      : super(key: key);

  final double size, borderWidth;
  final ImageProvider image;
  final Color borderColor, bgColor;
  final ImageProvider placeholderImage;

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
      child: image != MemoryImage(kTransparentImage)
          ? ClipOval(
              child: FadeInImage(
                placeholder: placeholderImage,
                image: image,
                fit: BoxFit.cover,
              ),
            )
          : placeholderImage,
    );
  }
}
