import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import './tab_menu.dart';
import './service_item.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({
    Key key,
    this.servicesData,
  }) : super(key: key);

  final List<Service> servicesData;

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
              children: servicesData
                  .map((Service item) => ServiceItem(serviceData: item))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
