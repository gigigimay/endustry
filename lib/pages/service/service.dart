import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/service/recent_service_group.dart';
import 'package:endustry/widgets/service/service_list.dart';
import 'package:endustry/widgets/service/suggested_service_group.dart';

class ServiceHomePage extends StatelessWidget {
  ServiceHomePage({
    Key key,
  }) : super(key: key);

  final List<Service> recentServicesData = MOCK_SERVICES;
  final List<Service> suggestedServicesData = Storage.suggestServices;
  final List<Service> servicesData = MOCK_SERVICES;
  final List<Department> departmentsData = MOCK_DEPARTMENT;

  final String currentTab = 'service';

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentTab: currentTab, isOnRoot: true),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'บริการ',
            actionWidget: SearchButton(initMode: CONSTANT.WORD_SERVICE_TH),
          ),
          SizedBox(height: CONSTANT.SIZE_MD),
          PageScrollBody(
            child: PagePadding(
              top: 0.0,
              child: Column(
                children: <Widget>[
                  RecentServiceGroup(
                    currentTab: currentTab,
                    maxItems: 2,
                  ),
                  SuggestedServiceGroup(
                    suggestedServicesData: suggestedServicesData,
                    currentTab: currentTab,
                    maxItems: 2,
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
