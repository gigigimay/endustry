import 'package:endustry/export.dart';
import 'package:endustry/widgets/news/hilightNewsItem.dart';
import '../../constants.dart' as CONSTANT;

class HilightNewsWidget extends StatefulWidget {
  HilightNewsWidget({Key key, this.hilightData}) : super(key: key);

  List hilightData;

  @override
  _HilightNewsWidgetState createState() => _HilightNewsWidgetState();
}

class _HilightNewsWidgetState extends State<HilightNewsWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.hilightData.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> hilight_news = widget.hilightData
        .map((item) => HilightNewsItem(
              title: item['label'],
            ))
        .toList();

    List<Widget> hilight_btn = widget.hilightData
        .asMap()
        .map((i, item) => MapEntry(
            i,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Icon(
                  Icons.lens,
                  size: CONSTANT.LG,
                  color: _tabController.index == i
                      ? CONSTANT.COLOR_PRIMARY
                      : CONSTANT.COLOR_DISABLED,
                ),
                onTap: () {
                  setState(() {
                    _tabController.index = i;
                  });
                  _tabController.animateTo(i);
                },
              ),
            )))
        .values
        .toList();

    print(height);
    return Column(
      children: <Widget>[
        Container(
          height: height * 0.24,
          child: TabBarView(
            controller: _tabController,
            children: hilight_news,
          ),
        ),
        SizedBox(
          height: CONSTANT.MD,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: hilight_btn,
        )
      ],
    );
  }
}
