import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/service/service_row_item.dart';

class ServiceListPage extends StatelessWidget {
  const ServiceListPage({
    Key key,
    @required this.servicesData,
    @required this.title,
    this.extraWidgets,
    this.currentTab = 'service',
  }) : super(key: key);

  final List<Service> servicesData;
  final List<Department> departmentsData = MOCK_DEPARTMENT;
  final List<Widget> Function(Service) extraWidgets;
  final String title, currentTab;

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentTab: currentTab),
      child: Column(
        children: <Widget>[
          PageAppBar(
              title: title,
              hasBackArrow: true,
              actionWidget: SearchButton(initMode: CONSTANT.WORD_SERVICE_TH)),
          SizedBox(height: CONSTANT.SIZE_MD),
          PageScrollBody(
            child: PagePadding(
              top: 0.0,
              side: CONSTANT.SIZE_MD,
              child: Column(
                children: servicesData
                    .map((Service service) => ServiceRowItem(
                          serviceData: service,
                          extraWidgets: extraWidgets,
                          currentTab: currentTab,
                          departmentData: departmentsData.firstWhere(
                              (Department d) => d.id == service.depId),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
