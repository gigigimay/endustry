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

  bool haveBackArrow;
  VoidCallback backArrowFunction;
  Widget actionWidget;
  String title;

  @override
  _PageAppBarState createState() => _PageAppBarState();
}

class _PageAppBarState extends State<PageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            widget.haveBackArrow
                ? GestureDetector(
                    onTap: widget.backArrowFunction,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: CONSTANT.COLOR_PRIMARY,
                      size: CONSTANT.SIZE_XX,
                    ))
                : Container(),
            SizedBox(
              width: CONSTANT.SIZE_MD,
            ),
            TitleText(widget.title)
          ],
        ),
        widget.actionWidget
      ],
    );
  }
}
