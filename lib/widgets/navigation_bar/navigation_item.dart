import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NavItem extends StatelessWidget {
  const NavItem(
      {Key key,
      this.title,
      this.icon,
      this.backToMainTopicPage,
      this.changeTopicPage,
      @required this.isOnPage})
      : super(key: key);
  final String title;
  final Widget icon;
  final Function backToMainTopicPage, changeTopicPage;
  final bool isOnPage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    var dy = isOnPage ? -20.0 : 0.0;

    print(isOnPage);

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
                image: isOnPage
                    ? DecorationImage(
                        image: AssetImage('assets/images/select_page.png'),
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
                icon: icon,
                color: isOnPage ? Colors.white : CONSTANT.COLOR_PRIMARY,
                iconSize:
                    icon.runtimeType == ImageIcon ? width * 0.06 : width * 0.08,
                onPressed:
                    isOnPage ? backToMainTopicPage : changeTopicPage,
              ),
              isOnPage
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
