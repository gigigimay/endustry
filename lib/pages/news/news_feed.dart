import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/news/news_in.dart';
import 'package:endustry/widgets/news/hilight_news_widget.dart';
import 'package:endustry/widgets/news/news_filter_dialog.dart';
import 'package:endustry/widgets/news/news_item.dart';

class NewsFeedPage extends StatefulWidget {
  NewsFeedPage({Key key}) : super(key: key);

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  final newsData = MOCK_NEWS;
  final newsType = MOCK_NEWSTYPES;
  String _selectedFilter = 'ข่าวทั้งหมด';

  setFilter(newFilter) {
    setState(() {
      _selectedFilter = newFilter;
    });
  }

  void itemOnPressed(News item) {
    Utils.navigatePush(context, NewsInPage(newsData: item));
  }

  @override
  Widget build(BuildContext context) {
    final List<News> displayedNewsData = newsData.where((item) {
      if (item.typeId == newsType.first.id) return false;
      if (_selectedFilter == 'ข่าวทั้งหมด') return true;
      return item.typeId ==
          newsType.firstWhere((item) => item.typeName == _selectedFilter).id;
    }).toList();
    displayedNewsData.sort((a, b) => b.date.compareTo(a.date));

    return BgLayout(
      navbar: NavigationBar(currentTab: 'news', isOnRoot: true),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'ข่าว',
            hasBackArrow: _selectedFilter != 'ข่าวทั้งหมด',
            backArrowFunction: () => setFilter('ข่าวทั้งหมด'),
            actionWidget: Row(
              children: <Widget>[
                SearchButton(initMode: CONSTANT.WORD_NEWS_TH),
                IconButtonInk(
                    icon: ImageIcon(
                      AssetImage('assets/images/filter.png'),
                      size: CONSTANT.SIZE_XL,
                    ),
                    onPressed: () {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
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
                  child: (_selectedFilter == 'ข่าวทั้งหมด' &&
                          newsData.firstWhere(
                                  (item) => item.typeId == 'nwst00') !=
                              null)
                      ? Column(
                          children: <Widget>[
                            HilightNewsWidget(
                              itemOnPressed: itemOnPressed,
                              hilightData: newsData
                                  .where((item) => item.typeId == 'nwst00')
                                  .toList(),
                            ),
                            SizedBox(height: CONSTANT.SIZE_MD),
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
                          children: displayedNewsData
                              .map((item) => NewsItem(
                                    newsData: item,
                                    itemOnPressed: itemOnPressed,
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
