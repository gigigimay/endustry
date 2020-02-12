import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';
import 'package:endustry/widgets/home/content_group.dart';
import 'package:endustry/widgets/home/list_item.dart';
import 'package:endustry/widgets/service/service_list.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key key}) : super(key: key);

  final List<Service> recentServicesData = MOCK_SERVICES;
  final List<Service> suggestedServicesData = MOCK_SERVICES;
  final List<Service> servicesData = MOCK_SERVICES;
  final List<Department> departmentsData = MOCK_DEPARTMENT;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = ((width - CONSTANT.SIZE_XL) / 2) - CONSTANT.SIZE_XL;

    return BgLayout(
      navbar: NavigationBar(currentpage: 'service'),
      child: Column(
        children: <Widget>[
          PageAppBar(title: 'บริการ', actionWidget: SearchButton()),
          SizedBox(height: CONSTANT.SIZE_MD),
          PageScrollBody(
            child: PagePadding(
              child: Column(
                children: <Widget>[
                  ContentGroup(
                    title: 'การใช้งานล่าสุด',
                    // TODO: add onSeeAll
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
                                ServiceInPage(serviceData: service),
                              ),
                            ))
                        .toList(),
                  ),
                  ContentGroup(
                    title: 'บริการแนะนำสำหรับคุณ',
                    // TODO: add onSeeAll
                    children: suggestedServicesData
                        .sublist(0, 4)
                        .map((Service service) => ListItem(
                              label: service.name,
                              itemWidth: itemWidth,
                              imageHeight: itemWidth * 2 / 3,
                              imageUrl: service.image,
                              padding: EdgeInsets.all(0),
                              onPressed: () => Utils.navigatePush(
                                context,
                                ServiceInPage(serviceData: service),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: CONSTANT.SIZE_XX),
                  Container(
                    child: ServiceList(
                      servicesData: servicesData,
                      departmentsData: departmentsData,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
