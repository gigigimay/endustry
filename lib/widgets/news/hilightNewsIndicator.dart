import 'package:endustry/export.dart';
import 'package:endustry/widgets/news/hilightNewsItem.dart';
import '../../constants.dart' as CONSTANT;

class HilightNewsIndicator extends StatefulWidget {
  HilightNewsIndicator({Key key, this.tabController, this.indexPage})
      : super(key: key);

  TabController tabController;
  int indexPage;

  @override
  _HilightNewsIndicatorState createState() => _HilightNewsIndicatorState();
}

class _HilightNewsIndicatorState extends State<HilightNewsIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Icon(
          Icons.lens,
          size: CONSTANT.LG,
          color: widget.tabController.index == widget.indexPage
              ? CONSTANT.COLOR_PRIMARY
              : CONSTANT.COLOR_DISABLED,
        ),
      ),
    );
  }
}
