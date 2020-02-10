import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    Key key,
    @required this.itemWidth,
    @required this.width,
  }) : super(key: key);

  final double itemWidth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth - 28,
      child: Column(
        children: <Widget>[
          Container(
            width: width * 0.25,
            height: width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: CONSTANT.COLOR_PRIMARY,
                width: 5,
              ),
            ),
          ),
          SizedBox(height: CONSTANT.SIZE_SM),
          Text(
            'datadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
            style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
