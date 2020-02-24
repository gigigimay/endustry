import 'package:endustry/export.dart';
import 'package:endustry/pages/home_page.dart';
import 'package:endustry/pages/service/service_page.dart';

class AppLayout extends StatefulWidget {
  AppLayout({Key key}) : super(key: key);

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  PageController _pageController = PageController(initialPage: 0);
  checkPageCtrl() => _pageController.hasClients;

  changePage(int page) {
    if (checkPageCtrl()) {
      _pageController.jumpToPage(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        HomePage(
          changePage: changePage,
        ),
        NewsPage(
          changePage: changePage,
        ),
        ServicePage(
          changePage: changePage,
        ),
        KnowledgePage(
          changePage: changePage,
        ),
        MenuPage(
          goBackToFirst: () {},
          changePage: changePage,
        )
      ],
    );
  }
}
