import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';
import 'package:endustry/pages/service/service_list_page.dart';
import 'package:endustry/widgets/home/content_group.dart';
import 'package:endustry/widgets/home/list_item.dart';

class RecentServiceGroup extends StatelessWidget {
  const RecentServiceGroup({
    Key key,
    @required this.recentServicesData,
    this.currentTab = 'service',
  }) : super(key: key);

  final List<Service> recentServicesData;
  final String currentTab;

  final String title = 'การใช้งานล่าสุด';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = (width / 2) - (CONSTANT.SIZE_XL + CONSTANT.SIZE_MD);
    return ContentGroup(
      title: title,
      onSeeAll: () => Utils.navigatePush(
          context,
          ServiceListPage(
            servicesData: recentServicesData,
            title: title,
            currentTab: currentTab,
            extraWidgets: (Service service) => [
              SizedBox(height: CONSTANT.SIZE_MD),
              Text(
                // TODO: change to real history data
                'ใช้งานเมื่อ 1 นาทีที่แล้ว',
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          )),
      //TODO: sort service by last used time
      children: recentServicesData.reversed
          .toList()
          .sublist(0, 4)
          .map((Service service) => ListItem(
                label: service.name,
                itemWidth: itemWidth,
                imageHeight: itemWidth * 2 / 3,
                imageUrl: service.image,
                padding: EdgeInsets.all(0),
                onPressed: () => Utils.navigatePush(
                  context,
                  ServiceInPage(
                    serviceData: service,
                    currentTab: currentTab,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
