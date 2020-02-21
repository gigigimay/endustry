import 'package:endustry/export.dart';
import './navigation_item.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar(
      {Key key,
      @required this.currentpage,
      this.changeTopicPage,
      this.backToFirstPage})
      : super(key: key);

  final currentpage;
  final Function backToFirstPage;
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
                    icon: ImageIcon(
                      AssetImage('assets/images/home_white.png'),
                    ),
                    isOnPage: widget.currentpage == 'home',
                    changeTopicPage: () => widget.changeTopicPage(0),
                    backToMainTopicPage: widget.backToFirstPage),
                NavItem(
                    title: 'ข่าว',
                    icon: ImageIcon(
                      AssetImage('assets/images/news_white.png'),
                    ),
                    isOnPage: widget.currentpage == 'news',
                    changeTopicPage: () => widget.changeTopicPage(1),
                    backToMainTopicPage: widget.backToFirstPage),
                NavItem(
                    title: 'บริการ',
                    icon: ImageIcon(
                      AssetImage('assets/images/service_white.png'),
                    ),
                    isOnPage: widget.currentpage == 'service',
                    changeTopicPage: () => widget.changeTopicPage(2),
                    backToMainTopicPage: widget.backToFirstPage),
                NavItem(
                    title: 'คลังความรู้',
                    icon: ImageIcon(
                      AssetImage('assets/images/know_white.png'),
                    ),
                    isOnPage: widget.currentpage == 'knowledge',
                    changeTopicPage: () => widget.changeTopicPage(3),
                    backToMainTopicPage: widget.backToFirstPage),
                NavItem(
                    title: 'โปรไฟล์',
                    icon: Icon(Icons.menu),
                    isOnPage: widget.currentpage == 'menu',
                    changeTopicPage: () => widget.changeTopicPage(4),
                    backToMainTopicPage: widget.backToFirstPage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
