import 'package:endustry/export.dart';
import 'package:endustry/widgets/news/hilight_news_item.dart';
import '../../constants.dart' as CONSTANT;

class HilightNewsWidget extends StatefulWidget {
  HilightNewsWidget({Key key, this.hilightData, this.itemOnPressed})
      : super(key: key);

  final List hilightData;
  final Function itemOnPressed;

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
    _tabController.addListener(() => setState(() {
          _tabController.index;
        }));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<Widget> hilightNews = widget.hilightData
        .map((item) => HilightNewsItem(
              newsData: item,
              itemOnPressed: widget.itemOnPressed,
            ))
        .toList();

    List<Widget> hilightButton = widget.hilightData
        .asMap()
        .map((i, item) => MapEntry(
            i,
            Padding(
              padding: EdgeInsets.all(CONSTANT.SIZE_SM),
              child: GestureDetector(
                child: Icon(
                  Icons.lens,
                  size: CONSTANT.SIZE_LG,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CONSTANT.SIZE_XL),
          child: Text(
            'ไฮไลท์',
            style: CONSTANT.TEXT_STYLE_HEADING,
          ),
        ),
        SizedBox(
          height: CONSTANT.SIZE_MD,
        ),
        Container(
          height: height * 0.24,
          child: TabBarView(
            controller: _tabController,
            children: hilightNews,
          ),
        ),
        SizedBox(
          height: CONSTANT.SIZE_MD,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: hilightButton,
        )
      ],
    );
  }
}
