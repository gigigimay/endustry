import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ListItem extends StatelessWidget {
  const ListItem(
      {Key key,
      this.itemWidth,
      this.imageHeight,
      this.padding = const EdgeInsets.all(CONSTANT.SIZE_SM),
      this.onPressed,
      @required this.label})
      : super(key: key);

  final double itemWidth, imageHeight;
  final String label;
  final EdgeInsetsGeometry padding;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double height = imageHeight ?? itemWidth;
    return FlatButton(
      padding: padding,
      onPressed: onPressed ?? () => print('pressed! ${this.label}'),
      child: Container(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: itemWidth,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
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
