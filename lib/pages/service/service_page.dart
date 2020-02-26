import 'package:endustry/export.dart';
import 'package:endustry/pages/service/department_in.dart';
import 'package:endustry/pages/service/service.dart';
import 'package:endustry/pages/service/service_in.dart';

class ServicePage extends StatelessWidget {
  ServicePage({Key key, this.changePage}) : super(key: key);

  final Function changePage;

  final List<Service> allServicesData = MOCK_SERVICES;
  final List<Service> suggestedServicesData = MOCK_SERVICES;
  final List<Service> recentServicesData = MOCK_SERVICES;
  final List<Department> allDepartmentsData = MOCK_DEPARTMENT;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: 'service/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'service/':
              builder = (BuildContext _) => ServiceHomePage(
                    servicesData: allServicesData,
                    recentServicesData: recentServicesData,
                    suggestedServicesData: suggestedServicesData,
                    departmentsData: allDepartmentsData,
                  );
              break;
            case 'service/service_in':
              final ServiceInArgs args = settings.arguments;
              builder = (BuildContext _) =>
                  ServiceInPage(serviceData: args.serviceData);
              break;
            case 'service/department_in':
              final DepartmentInArgs args = settings.arguments;
              builder = (BuildContext _) =>
                  DepartmentInPage(departmentData: args.departmentData);
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(
              builder: builder, settings: settings);
        });
  }
}
