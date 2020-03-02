import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';
import 'package:endustry/pages/service/service_list_page.dart';
import 'package:endustry/widgets/home/content_group.dart';
import 'package:endustry/widgets/home/list_item.dart';

class SuggestedServiceGroup extends StatelessWidget {
  const SuggestedServiceGroup({
    Key key,
    @required this.suggestedServicesData,
    this.currentTab = 'service',
    this.maxItems = 4,
  }) : super(key: key);

  final List<Service> suggestedServicesData;
  final String currentTab;
  final int maxItems;

  final String title = 'บริการแนะนำ';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = (width / 2) - (CONSTANT.SIZE_XL + CONSTANT.SIZE_MD);
    final int length = suggestedServicesData.length;

    return ContentGroup(
      title: title,
      onSeeAll: () => Utils.navigatePush(
          context,
          ServiceListPage(
            servicesData: suggestedServicesData,
            title: title,
            currentTab: currentTab,
          )),
      children: suggestedServicesData
          .sublist(0, length < maxItems ? length : maxItems)
          .map((Service service) => ListItem(
                label: service.name,
                itemWidth: itemWidth,
                imageHeight: itemWidth * 2 / 3,
                imageUrl: service.image,
                padding: EdgeInsets.all(0),
                onPressed: () => Utils.navigatePush(
                  context,
                  ServiceInPage(serviceData: service, currentTab: currentTab),
                ),
              ))
          .toList(),
    );
  }
}
