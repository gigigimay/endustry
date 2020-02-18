import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/news/hilight_news_widget.dart';
import 'package:endustry/widgets/news/news_filter_dialog.dart';
import 'package:endustry/widgets/news/news_item.dart';

class NewsFeedPage extends StatefulWidget {
  NewsFeedPage({Key key, this.itemOnPressed}) : super(key: key);

  final Function itemOnPressed;

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage>
    with SingleTickerProviderStateMixin {
  var newsData = MOCK_NEWS;

  String _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = 'ข่าวทั้งหมด';
  }

  setFilter(newFilter) {
    setState(() {
      _selectedFilter = newFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentpage: 'news'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'ข่าว',
            hasBackArrow: _selectedFilter != 'ข่าวทั้งหมด',
            backArrowFunction: () => setFilter('ข่าวทั้งหมด'),
            actionWidget: Row(
              children: <Widget>[
                SearchButton(),
                IconButtonInk(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            print(_selectedFilter);
                            return NewsFilterDialog(
                              newsData: newsData,
                              selectedFilter: _selectedFilter,
                              onPressed: setFilter,
                            );
                          });
                    }),
              ],
            ),
          ),
          PageScrollBody(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: _selectedFilter == 'ข่าวทั้งหมด' &&
                          newsData
                                  .where((item) => item.typeId == 'nwst00')
                                  .length >
                              0
                      ? Column(
                          children: <Widget>[
                            HilightNewsWidget(
                              itemOnPressed: widget.itemOnPressed,
                              hilightData: newsData
                                  .where((item) => item.typeId == 'nwst00')
                                  .toList(),
                            ),
                            SizedBox(
                              height: CONSTANT.SIZE_MD,
                            ),
                          ],
                        )
                      : Container(),
                ),
                PagePadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _selectedFilter,
                        style: CONSTANT.TEXT_STYLE_HEADING,
                      ),
                      Column(
                          children: newsData
                              .where((item) {
                                if (item.typeId == MOCK_NEWSTYPES.first.id)
                                  return false;
                                else if (_selectedFilter == 'ข่าวทั้งหมด')
                                  return true;
                                else
                                  return item.typeId ==
                                      MOCK_NEWSTYPES
                                          .where((item) =>
                                              item.typeName == _selectedFilter)
                                          .first
                                          .id;
                              })
                              .toList()
                              .map((item) => NewsItem(
                                    newsData: item,
                                    itemOnPressed: widget.itemOnPressed,
                                  ))
                              .toList()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
