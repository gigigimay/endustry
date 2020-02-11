import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    Key key,
    @required this.text,
    this.onPressed,
    this.imageUrl,
  }) : super(key: key);

  final String text, imageUrl;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = (width / 2) - (CONSTANT.SIZE_XL * 2.5);
    double iconWidth = itemWidth * 0.75;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
        onTap: onPressed ?? () => print('tap: ' + text),
        child: Container(
          width: itemWidth,
          child: Column(
            children: <Widget>[
              Container(
                width: iconWidth,
                height: iconWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: CONSTANT.COLOR_PRIMARY,
                    width: CONSTANT.BORDER_WIDTH_THICK,
                  ),
                ),
                child: imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: imageUrl,
                        ),
                      )
                    : Container(),
              ),
              SizedBox(height: CONSTANT.SIZE_SM),
              Text(
                text,
                style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
