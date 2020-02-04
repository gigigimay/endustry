import 'package:endustry/export.dart';
import '../../constants.dart' as CONSTANT;
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height * 0.1,
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavItem(
              icon: Icons.home,
              currentPage: widget.currentpage,
              comparePage: 'home',
              onPressed: () {
                navigateTo(HomePage());
              },
            ),
            NavItem(
              icon: Icons.subtitles,
              currentPage: widget.currentpage,
              comparePage: 'news',
              onPressed: () {
                navigateTo(NewsPage());
              },
            ),
            NavItem(
              icon: Icons.person,
              currentPage: widget.currentpage,
              comparePage: 'service',
              onPressed: () {
                navigateTo(ServicePage());
              },
            ),
            NavItem(
              icon: Icons.library_books,
              currentPage: widget.currentpage,
              comparePage: 'knowledge',
              onPressed: () {
                navigateTo(KnowledgePage());
              },
            ),
            NavItem(
              icon: Icons.more_horiz,
              currentPage: widget.currentpage,
              comparePage: 'menu',
              onPressed: () {
                navigateTo(MenuPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
