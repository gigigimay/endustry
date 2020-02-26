import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/home/content_group.dart';
import 'package:endustry/widgets/home/list_item.dart';
import 'package:endustry/widgets/service/service_list.dart';

class ServiceHomePage extends StatelessWidget {
  const ServiceHomePage({
    Key key,
    this.changePage,
    this.recentServicesData,
    this.suggestedServicesData,
    this.servicesData,
    this.departmentsData,
  }) : super(key: key);

  final List<Service> recentServicesData;
  final List<Service> suggestedServicesData;
  final List<Service> servicesData;
  final List<Department> departmentsData;

  final Function changePage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = ((width - CONSTANT.SIZE_XL) / 2) - CONSTANT.SIZE_XL;

    return Column(
      children: <Widget>[
        PageAppBar(
            title: 'บริการ',
            actionWidget: SearchButton(
              initMode: CONSTANT.WORD_SERVICE_TH,
            )),
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
                            onPressed: () => Utils.navigatePushNamed(
                              context,
                              'service/service_in',
                              arguments: ServiceInArgs(service),
                            ),
                          ))
                      .toList(),
                ),
                ContentGroup(
                  title: 'บริการแนะนำ',
                  // TODO: add onSeeAll
                  children: suggestedServicesData
                      .sublist(0, 4)
                      .map((Service service) => ListItem(
                            label: service.name,
                            itemWidth: itemWidth,
                            imageHeight: itemWidth * 2 / 3,
                            imageUrl: service.image,
                            padding: EdgeInsets.all(0),
                            onPressed: () => Utils.navigatePushNamed(
                              context,
                              'service/service_in',
                              arguments: ServiceInArgs(service),
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
    );
  }
}
