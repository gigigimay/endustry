import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class CircleFadeInImage extends StatelessWidget {
  const CircleFadeInImage({
    Key key,
    @required this.size,
    @required this.image,
    this.borderColor = CONSTANT.COLOR_PRIMARY,
    this.borderWidth = CONSTANT.BORDER_WIDTH_THICK,
    this.bgColor = Colors.white,
    this.placeholderImage = const AssetImage(CONSTANT.PIC),
    this.padding,
    this.imagefit,
  }) : super(key: key);

  final double size, borderWidth;
  final ImageProvider image;
  final Color borderColor, bgColor;
  final ImageProvider placeholderImage;
  final EdgeInsets padding;
  final BoxFit imagefit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: size,
      height: size,
      decoration: ShapeDecoration(
        color: bgColor,
        shape: CircleBorder(
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      child: ClipOval(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Image(image: placeholderImage),
            FadeInImage(
              placeholder: placeholderImage,
              image: image != MemoryImage(kTransparentImage)
                  ? image
                  : placeholderImage,
              fit: imagefit ?? BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
