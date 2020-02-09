import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class BoxLayout extends StatelessWidget {
  BoxLayout({
    Key key,
    this.child,
    this.title,
    this.topWidget,
    this.bottomWidget,
    this.topOverlap = 0.0,
    this.bottomOverlap = 0.0,
  }) : super(key: key);

  final Widget child, topWidget, bottomWidget;
  final double topOverlap, bottomOverlap;
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BgLayout(
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: title,
            hasBackArrow: true,
            backArrowFunction: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: PagePadding(
              bottom: height * 0.05,
              child: Stack(
                children: <Widget>[
                  // content of page
                  RoundedBox(
                    margin: EdgeInsets.only(
                      top: topOverlap,
                      bottom: bottomOverlap,
                    ),
                    padding: EdgeInsets.only(
                      top: topOverlap + CONSTANT.SIZE_XL,
                      left: CONSTANT.SIZE_XL,
                      right: CONSTANT.SIZE_XL,
                      bottom: bottomOverlap + CONSTANT.SIZE_XL,
                    ),
                    child: child,
                  ),

                  // top content (avatar/image/etc.)
                  topWidget != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[topWidget],
                        )
                      : Container(),

                  // bottom content (button/etc.)
                  topWidget != null
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[bottomWidget],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
