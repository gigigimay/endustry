import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class PageAppBar extends StatelessWidget {
  PageAppBar(
      {Key key,
      this.hasBackArrow = false,
      this.backArrowFunction,
      this.actionWidget,
      @required this.title})
      : super(key: key);

  final bool hasBackArrow;
  final Function backArrowFunction;
  final Widget actionWidget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      top: CONSTANT.SIZE_XS,
      side: CONSTANT.SIZE_LG,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              hasBackArrow
                  ? IconButtonInk(
                      onPressed: backArrowFunction ??
                          () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : Container(),
              Container(
                child: TitleText(title),
                padding: EdgeInsets.only(
                  top: CONSTANT.SIZE_SM,
                  left: CONSTANT.SIZE_SM,
                ),
              )
            ],
          ),
          actionWidget ?? Container()
        ],
      ),
    );
  }
}
