import 'package:endustry/export.dart';
import '../constants.dart' as CONSTANT;

class Navigationbar extends StatefulWidget {
  Navigationbar({Key key, @required this.currentpage}) : super(key: key);

  String currentpage;

  @override
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
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
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavigationBarItem(
              icon: Icons.home,
              currentPage: widget.currentpage,
              comparePage: 'home',
              onPressed: () {
                navigateTo(HomePage());
              },
            ),
            NavigationBarItem(
              icon: Icons.subtitles,
              currentPage: widget.currentpage,
              comparePage: 'news',
              onPressed: () {
                navigateTo(NewsPage());
              },
            ),
            NavigationBarItem(
              icon: Icons.person,
              currentPage: widget.currentpage,
              comparePage: 'service',
              onPressed: () {
                navigateTo(ServicePage());
              },
            ),
            NavigationBarItem(
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
