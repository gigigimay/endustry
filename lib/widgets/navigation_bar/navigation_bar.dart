import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import './navigation_item.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key, @required this.currentpage}) : super(key: key);

  final currentpage;

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  navigateTo(page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
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
                  icon: ImageIcon(
                    AssetImage('assets/images/home_white.png'),
                  ),
                  currentPage: widget.currentpage,
                  comparePage: 'home',
                  onPressed: () {
                    navigateTo(HomePage());
                  },
                ),
                NavItem(
                  title: 'ข่าว',
                  icon: ImageIcon(
                    AssetImage('assets/images/news_white.png'),
                  ),
                  currentPage: widget.currentpage,
                  comparePage: 'news',
                  onPressed: () {
                    navigateTo(NewsPage());
                  },
                ),
                NavItem(
                  title: 'บริการ',
                  icon: ImageIcon(
                    AssetImage('assets/images/service_white.png'),
                  ),
                  currentPage: widget.currentpage,
                  comparePage: 'service',
                  onPressed: () {
                    navigateTo(ServicePage());
                  },
                ),
                NavItem(
                  title: 'คลังความรู้',
                  icon: ImageIcon(
                    AssetImage('assets/images/know_white.png'),
                  ),
                  currentPage: widget.currentpage,
                  comparePage: 'knowledge',
                  onPressed: () {
                    navigateTo(KnowledgePage());
                  },
                ),
                NavItem(
                  title: 'โปรไฟล์',
                  icon: Icon(Icons.menu),
                  currentPage: widget.currentpage,
                  comparePage: 'menu',
                  onPressed: () {
                    navigateTo(MenuPage());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
