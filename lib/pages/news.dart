import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/news/hilightNewsWidget.dart';
import 'package:endustry/widgets/news/newsItem.dart';
import 'package:endustry/widgets/newsFilterDialog.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  var hilightData = [
    {
      'title': 'ค่าธรรมเนียมโรงงาน ฟหกด เอกอาสอวอ',
      'content': 'Loremasdasdasd',
      'imgurl': 'i1',
      'date': '1969-07-20 20:18:04Z',
      'author': 'josh'
    },
    {
      'title': 'asd',
      'content': 'Loremasdasdasd',
      'imgurl': 'i1',
      'date': '1969-07-20 20:18:04Z',
      'author': 'josh'
    },
    {
      'title': 'asd',
      'content': 'Loremasdasdasd',
      'imgurl': 'i1',
      'date': '1969-07-20 20:18:04Z',
      'author': 'josh'
    },
  ];

  var newsData_json = {
    'ข่าวประชาสัมพันธ์': [
      {
        'title': 'ประชา',
        'content': 'Loremasdasdasd',
        'imgurl': 'i1',
        'date': '1969-07-20 20:18:04Z',
        'author': 'josh'
      },
      {
        'title': 'สัมพันธ์',
        'content': 'Loremasdasdasd',
        'imgurl': 'i1',
        'date': '1969-07-21 20:18:04Z',
        'author': 'josh'
      },
    ],
    'ข่าวอุตสาหกรรมจังหวัด': [
      {
        'title': 'ประจำ',
        'content': 'Loremasdasdasd',
        'imgurl': 'i1',
        'date': '1969-07-20 20:18:04Z',
        'author': 'josh'
      },
      {
        'title': 'จังหวัด',
        'content': 'Loremasdasdasd',
        'imgurl': 'i1',
        'date': '1969-07-21 20:18:04Z',
        'author': 'josh'
      },
    ],
    'ข่าวรับสมัครงาน': [
      {
        'title': 'รับ',
        'content': 'Loremasdasdasd',
        'imgurl': 'i1',
        'date': '1969-07-20 20:18:04Z',
        'author': 'josh'
      },
      {
        'title': 'สมัคร',
        'content': 'Loremasdasdasd',
        'imgurl': 'i1',
        'date': '1969-07-21 20:18:04Z',
        'author': 'josh'
      },
      {
        'title': 'งาน',
        'content': 'Loremasdasdasd',
        'imgurl': 'i1',
        'date': '1969-07-21 20:18:04Z',
        'author': 'josh'
      },
    ]
  };

  var newsData = {'ข่าวทั้งหมด': []};

  String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = 'ข่าวทั้งหมด';
    newsData[selectedFilter] =
        newsData_json.values.toList().expand((x) => x).toList();
    newsData.addAll(newsData_json);
    print(newsData);
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentpage: 'news'),
      child: PagePadding(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    selectedFilter != 'ข่าวทั้งหมด'
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = 'ข่าวทั้งหมด';
                              });
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: CONSTANT.COLOR_PRIMARY,
                              size: CONSTANT.SIZE_XX,
                            ))
                        : Container(),
                    SizedBox(
                      width: CONSTANT.SIZE_MD,
                    ),
                    TitleText('ข่าว')
                  ],
                ),
                Row(
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
                )
              ],
            ),
            PageScrollBody(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  selectedFilter == 'ข่าวทั้งหมด'
                      ? Column(
                          children: <Widget>[
                            HilightNewsWidget(
                              hilightData: hilightData,
                            ),
                            SizedBox(
                              height: CONSTANT.SIZE_MD,
                            ),
                          ],
                        )
                      : Container(),
                  Text(
                    selectedFilter,
                    style: CONSTANT.TEXT_STYLE_HEADING,
                  ),
                  Column(
                      children: newsData[selectedFilter]
                          .map((item) => NewsItem(
                                newsData: item,
                              ))
                          .toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
