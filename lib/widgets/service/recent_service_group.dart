import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';
import 'package:endustry/pages/service/service_list_page.dart';
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/home/content_group.dart';
import 'package:endustry/widgets/home/list_item.dart';

class RecentServiceGroup extends StatelessWidget {
  RecentServiceGroup({
    Key key,
    this.currentTab = 'service',
    this.maxItems = 4,
  }) : super(key: key);

  final String currentTab;
  final int maxItems;

  final List<ServiceHistory> servicesHistoryData = Storage.serviceHistory;
  final List<Service> servicesData = MOCK_SERVICES;

  final String title = 'การใช้งานล่าสุด';

  @override
  Widget build(BuildContext context) {
    if (servicesHistoryData.isEmpty) return Container();
    double width = MediaQuery.of(context).size.width;
    double itemWidth = (width / 2) - (CONSTANT.SIZE_XL + CONSTANT.SIZE_MD);

    final List<Service> recentServicesData = servicesHistoryData
        .map((ServiceHistory h) =>
            servicesData.firstWhere((Service s) => s.id == h.serviceId))
        .toList();

    final int length = recentServicesData.length;

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
                Utils.formatDateTime(servicesHistoryData
                    .firstWhere((ServiceHistory h) => h.serviceId == service.id)
                    .datetime
                    .toString()),
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: CONSTANT.FONT_SIZE_BODY * 0.8),
              )
            ],
          )),
      children: recentServicesData
          .toList()
          .sublist(0, length < maxItems ? length : maxItems)
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
