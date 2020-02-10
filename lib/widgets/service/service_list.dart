import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import './tab_menu.dart';
import './service_item.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({
    Key key,
    @required this.itemWidth,
    @required this.width,
  }) : super(key: key);

  final double itemWidth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabMenu(
            items: ['บริการทั้งหมด', 'หน่วยงาน'],
            selectedItem: 'บริการทั้งหมด'),
        Transform.translate(
          offset: Offset(0, -CONSTANT.SIZE_LG),
          child: RoundedBox(
            padding: EdgeInsets.symmetric(
              horizontal: CONSTANT.SIZE_XL,
              vertical: CONSTANT.SIZE_LG,
            ),
            child: Wrap(
              spacing: CONSTANT.SIZE_XL,
              runSpacing: CONSTANT.SIZE_XL,
              children: <Widget>[
                ServiceItem(itemWidth: itemWidth, width: width),
                ServiceItem(itemWidth: itemWidth, width: width),
                ServiceItem(itemWidth: itemWidth, width: width),
                ServiceItem(itemWidth: itemWidth, width: width),
                ServiceItem(itemWidth: itemWidth, width: width),
              ],
            ),
          ),
        )
      ],
    );
  }
}
