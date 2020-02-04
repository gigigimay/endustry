import 'package:endustry/export.dart';
import '../constants.dart' as CONSTANT;

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {Key key, this.icon, this.currentPage, this.comparePage, this.onPressed})
      : super(key: key);
  final IconData icon;
  final String currentPage;
  final String comparePage;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        decoration: BoxDecoration(
          color: currentPage == comparePage
              ? CONSTANT.COLOR_PRIMARY
              : Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          icon: Icon(icon),
          color: currentPage == comparePage
              ? Colors.white
              : CONSTANT.COLOR_PRIMARY,
          iconSize: width * 0.1,
          onPressed: currentPage != comparePage ? onPressed : () {},
        ));
  }
}
