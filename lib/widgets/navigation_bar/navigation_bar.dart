import 'package:endustry/export.dart';
import './navigation_item.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({
    Key key,
    @required this.currentpage,
    this.changeTopicPage,
  }) : super(key: key);

  final currentpage;
  final Function changeTopicPage;

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
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
                    icon: AssetImage('assets/images/home_white.png'),
                    isOnPage: widget.currentpage == 0,
                    changeTopicPage: () => widget.changeTopicPage(0),
                    backToMainTopicPage: () =>
                        Utils.navigatePushAndPopAll(context, HomePage())),
                // NavItem(
                //     title: 'ข่าว',
                //     icon: AssetImage('assets/images/news_white.png'),
                //     isOnPage: widget.currentpage == 1,
                //     changeTopicPage: () => widget.changeTopicPage(1),
                //     backToMainTopicPage: () =>
                //         Utils.navigatePushAndPopAll(context, NewsPage())),
                NavItem(
                    title: 'บริการ',
                    icon: AssetImage('assets/images/service_white.png'),
                    isOnPage: widget.currentpage == 2,
                    changeTopicPage: () => widget.changeTopicPage(2),
                    backToMainTopicPage: () =>
                        Utils.navigatePushAndPopAll(context, ServicePage())),
                // NavItem(
                //     title: 'คลังความรู้',
                //     icon: AssetImage('assets/images/know_white.png'),
                //     isOnPage: widget.currentpage == 3,
                //     changeTopicPage: () => widget.changeTopicPage(3),
                //     backToMainTopicPage: () =>
                //         Utils.navigatePushAndPopAll(context, KnowledgePage())),
                // NavItem(
                //     title: 'โปรไฟล์',
                //     icon: Icons.menu,
                //     isOnPage: widget.currentpage == 4,
                //     changeTopicPage: () => widget.changeTopicPage(4),
                //     backToMainTopicPage: () =>
                //         Utils.navigatePushAndPopAll(context, MenuPage())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
