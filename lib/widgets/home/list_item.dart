import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    this.itemWidth,
    this.imageHeight,
    this.padding = const EdgeInsets.all(CONSTANT.SIZE_SM),
    this.onPressed,
    this.image,
    this.imageUrl,
    @required this.label,
  }) : super(key: key);

  final double itemWidth, imageHeight;
  final String label;
  final EdgeInsetsGeometry padding;
  final Function onPressed;
  final Widget image;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double height = imageHeight ?? itemWidth;
    return FlatButton(
      padding: padding,
      onPressed: onPressed,
      child: Container(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: itemWidth,
              height: height,
              child: image ??
                  (imageUrl != null
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.circular(CONSTANT.BORDER_RADIUS),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: imageUrl,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container()),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
              ),
            ),
            const SizedBox(height: CONSTANT.SIZE_SM),
            Text(
              this.label,
              style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
