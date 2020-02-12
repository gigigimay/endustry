import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class PageAppBar extends StatefulWidget {
  PageAppBar(
      {Key key,
      this.hasBackArrow = false,
      this.backArrowFunction,
      this.actionWidget,
      @required this.title})
      : super(key: key);

  final bool hasBackArrow;
  final VoidCallback backArrowFunction;
  final Widget actionWidget;
  final String title;

  @override
  _PageAppBarState createState() => _PageAppBarState();
}

class _PageAppBarState extends State<PageAppBar> {
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
              widget.hasBackArrow
                  ? IconButtonInk(
                      onPressed: widget.backArrowFunction ??
                          () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : Container(),
              Container(
                child: TitleText(widget.title),
                padding: EdgeInsets.only(
                  top: CONSTANT.SIZE_SM,
                  left: CONSTANT.SIZE_SM,
                ),
              )
            ],
          ),
          widget.actionWidget ?? Container()
        ],
      ),
    );
  }
}
