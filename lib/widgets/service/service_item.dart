import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    Key key,
    @required this.serviceData
  }) : super(key: key);

  final Service serviceData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = (width / 2) - (CONSTANT.SIZE_XL * 2.5);
    double iconWidth = itemWidth * 0.75;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
        onTap: () => print('tap: ' + serviceData.name),
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
              ),
              SizedBox(height: CONSTANT.SIZE_SM),
              Text(
                serviceData.name,
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
