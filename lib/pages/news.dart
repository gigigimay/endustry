import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/news/hilightNewsWidget.dart';
import 'package:endustry/widgets/news/newsFilterDialog.dart';
import 'package:endustry/widgets/news/newsItem.dart';
import 'package:endustry/widgets/page_appbar.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  var newsData = MOCK_NEWS;

  String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = 'ข่าวทั้งหมด';
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentpage: 'news'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'ข่าว',
            haveBackArrow: selectedFilter != 'ข่าวทั้งหมด',
            backArrowFunction: () {
              setState(() {
                selectedFilter = 'ข่าวทั้งหมด';
              });
            },
            actionWidget: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: CONSTANT.SIZE_XX,
                  color: CONSTANT.COLOR_PRIMARY,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  iconSize: CONSTANT.SIZE_XX,
                  color: CONSTANT.COLOR_PRIMARY,
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return NewsFilterDialog(
                            newsData: newsData,
                            selectedFilter: selectedFilter,
                            state: this,
                          );
                        });
                  },
                )
              ],
            ),
          ),
          PageScrollBody(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: selectedFilter == 'ข่าวทั้งหมด' &&
                          newsData
                                  .where((item) => item.typeId == 'nwst00')
                                  .length >
                              0
                      ? Column(
                          children: <Widget>[
                            HilightNewsWidget(
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
                        selectedFilter,
                        style: CONSTANT.TEXT_STYLE_HEADING,
                      ),
                      Column(
                          children: newsData
                              .where((item) {
                                if (item.typeId == NEWSTYPES.first.id)
                                  return false;
                                else if (selectedFilter == 'ข่าวทั้งหมด')
                                  return true;
                                else
                                  return item.typeId ==
                                      NEWSTYPES
                                          .where((item) =>
                                              item.typeName == selectedFilter)
                                          .first
                                          .id;
                              })
                              .toList()
                              .map((item) => NewsItem(
                                    newsData: item,
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
