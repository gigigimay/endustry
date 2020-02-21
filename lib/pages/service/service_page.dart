import 'package:endustry/export.dart';
import 'package:endustry/pages/service/department_in.dart';
import 'package:endustry/pages/service/service_in.dart';

class ServicePage extends StatefulWidget {
  ServicePage({Key key, this.changePage}) : super(key: key);

  final Function changePage;

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  List<Service> _allServicesData, _suggestedServicesData, _favServicesData;
  List<Department> _allDepartmentsData;
  Service _servicesData;
  Department _departmentData;

  int _prevPage;

  PageController _pageController = PageController(initialPage: 0);

  checkPageCtrl() => _pageController.hasClients;

  goToServiceInPage(Service knowledgeData) {
    if (checkPageCtrl()) {
      setState(() {
        _servicesData = knowledgeData;
        _prevPage = _pageController.page.toInt();
      });

      _pageController.jumpToPage(2);
    }
  }

  goBack() {
    if (checkPageCtrl()) {
      _pageController.jumpToPage(_prevPage);
    }
  }

  goBackToFirst() {
    if (checkPageCtrl()) {
      _pageController.jumpToPage(0);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // TODO: Init Data here
    _allServicesData = MOCK_SERVICES;
    _allDepartmentsData = MOCK_DEPARTMENT;
    _suggestedServicesData = MOCK_SERVICES.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
        safeBottom: false,
        navbar: NavigationBar(
          currentpage: 'service',
          backToFirstPage: goBackToFirst,
          changeTopicPage: widget.changePage,
        ),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            ServiceFeedPage(),
            ServiceInPage(
              serviceData: _servicesData,
            ),
            DepartmentInPage(
              departmentData: _departmentData,
            ),
          ],
        ));
  }
}
