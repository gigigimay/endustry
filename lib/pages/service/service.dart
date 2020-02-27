import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';
import 'package:endustry/pages/service/service_list_page.dart';
import 'package:endustry/widgets/home/content_group.dart';
import 'package:endustry/widgets/home/list_item.dart';
import 'package:endustry/widgets/service/service_list.dart';

class ServiceHomePage extends StatelessWidget {
  const ServiceHomePage({
    Key key,
  }) : super(key: key);

  final List<Service> recentServicesData = MOCK_SERVICES;
  final List<Service> suggestedServicesData = MOCK_SERVICES;
  final List<Service> servicesData = MOCK_SERVICES;
  final List<Department> departmentsData = MOCK_DEPARTMENT;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = ((width - CONSTANT.SIZE_XL) / 2) - CONSTANT.SIZE_XL;

    return BgLayout(
      navbar: NavigationBar(currentTab: 'service', isOnRoot: true),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'บริการ',
            actionWidget: SearchButton(initMode: CONSTANT.WORD_SERVICE_TH),
          ),
          SizedBox(height: CONSTANT.SIZE_MD),
          PageScrollBody(
            child: PagePadding(
              child: Column(
                children: <Widget>[
                  ContentGroup(
                    title: 'การใช้งานล่าสุด',
                    onSeeAll: () => Utils.navigatePush(
                        context,
                        ServiceListPage(
                          servicesData: recentServicesData,
                          title: 'การใช้งานล่าสุด',
                          extraWidgets: (Service service) => [
                            SizedBox(height: CONSTANT.SIZE_MD),
                            Text(
                              // TODO: change to real history data
                              'ใช้งานเมื่อ 1 นาทีที่แล้ว',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )
                          ],
                        )),
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
                                  context, ServiceInPage(serviceData: service)),
                            ))
                        .toList(),
                  ),
                  ContentGroup(
                    title: 'บริการแนะนำ',
                    onSeeAll: () => Utils.navigatePush(
                        context,
                        ServiceListPage(
                            servicesData: suggestedServicesData,
                            title: 'บริการแนะนำ')),
                    children: suggestedServicesData
                        .sublist(0, 4)
                        .map((Service service) => ListItem(
                              label: service.name,
                              itemWidth: itemWidth,
                              imageHeight: itemWidth * 2 / 3,
                              imageUrl: service.image,
                              padding: EdgeInsets.all(0),
                              onPressed: () => Utils.navigatePush(
                                  context, ServiceInPage(serviceData: service)),
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
