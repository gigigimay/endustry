import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class PageAppBar extends StatefulWidget {
  PageAppBar(
      {Key key,
      this.haveBackArrow = false,
      this.backArrowFunction,
      this.actionWidget,
      @required this.title})
      : super(key: key);

  final bool haveBackArrow;
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
      side: CONSTANT.SIZE_MD,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              widget.haveBackArrow
                  ? IconButtonInk(
                      onTap: widget.backArrowFunction,
                      icon: Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColor,
                      size: CONSTANT.SIZE_XX,
                    )
                  : Container(),
              SizedBox(
                width: CONSTANT.SIZE_MD,
              ),
              Container(
                child: TitleText(widget.title),
                padding: EdgeInsets.only(top: CONSTANT.SIZE_SM),
              )
            ],
          ),
          widget.actionWidget != null ? widget.actionWidget : Container()
        ],
      ),
    );
  }
}
