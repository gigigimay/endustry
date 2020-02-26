import 'package:endustry/export.dart';
import './navigation_item.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({
    Key key,
    @required this.currentpage,
    this.isOnRoot = false,
  }) : super(key: key);

  final currentpage;
  final bool isOnRoot;

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(0, -3),
              blurRadius: 6,
            )
          ],
        ),
        child: SafeArea(
          top: false,
          child: Container(
            height: height * 0.1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NavItem(
                  title: 'หน้าแรก',
                  icon: AssetImage('assets/images/home_white.png'),
                  isOnPage: currentpage == 'home',
                  isOnRoot: isOnRoot,
                  targetPage: HomePage(),
                ),
                NavItem(
                  title: 'ข่าว',
                  icon: AssetImage('assets/images/news_white.png'),
                  isOnPage: currentpage == 'news',
                  isOnRoot: isOnRoot,
                  targetPage: NewsFeedPage(),
                ),
                NavItem(
                  title: 'บริการ',
                  icon: AssetImage('assets/images/service_white.png'),
                  isOnPage: currentpage == 'service',
                  isOnRoot: isOnRoot,
                  targetPage: ServiceHomePage(),
                ),
                NavItem(
                  title: 'คลังความรู้',
                  icon: AssetImage('assets/images/know_white.png'),
                  isOnPage: currentpage == 'knowledges',
                  isOnRoot: isOnRoot,
                  targetPage: KnowledgePage(),
                ),
                NavItem(
                  title: 'โปรไฟล์',
                  icon: Icons.menu,
                  isOnPage: currentpage == 'menu',
                  isOnRoot: isOnRoot,
                  targetPage: MenuPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
