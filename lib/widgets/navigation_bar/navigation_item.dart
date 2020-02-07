import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NavItem extends StatelessWidget {
  const NavItem(
      {Key key,
      this.title,
      this.icon,
      this.iconURL = '',
      this.currentPage,
      this.comparePage,
      this.onPressed})
      : super(key: key);
  final String title;
  final Icon icon;
  final String iconURL;
  final String currentPage;
  final String comparePage;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var dy = currentPage == comparePage ? -20.0 : 0.0;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Transform.translate(
          offset: Offset(0, dy),
          child: Transform.scale(
            scale: 1.3,
            child: Container(
              width: width / 5.75,
              decoration: BoxDecoration(
                image: currentPage == comparePage
                    ? DecorationImage(
                        image: AssetImage('assets/images/select page.png'),
                      )
                    : null,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, dy == 0 ? 0 : dy - 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: iconURL.isNotEmpty
                    ? ImageIcon(
                        AssetImage(iconURL),
                      )
                    : icon,
                color: currentPage == comparePage
                    ? Colors.white
                    : CONSTANT.COLOR_PRIMARY,
                iconSize: iconURL.isNotEmpty ? width * 0.06 : width * 0.08,
                onPressed: currentPage != comparePage ? onPressed : () {},
              ),
              currentPage == comparePage
                  ? Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: CONSTANT.FONT_SIZE_BODY,
                          fontWeight: FontWeight.w700,
                          height: 0.8),
                    )
                  : Container()
            ],
          ),
        )
      ],
    );
  }
}
