import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/news/hilightNewsWidget.dart';
import 'package:endustry/widgets/news/newsItem.dart';

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
      'label':
          'ค่าธรรมเนียมรายปีโรงงานฟหกฟหกฟหกฟหกฟหกฟหกฟหกฟหกฟหกฟหกฟหกฟหกฟหกห',
      'imgurl': 'i1'
    },
    {'label': 'Hzxc', 'imgurl': 'i2'},
    {'label': 'Hqwe', 'imgurl': 'i3'},
  ];

  var newsData = [
    {
      'title': 'asd',
      'imgurl': 'i1',
      'date': '1969-07-20 20:18:04Z',
      'author': 'josh'
    },
    {
      'title': 'sdf',
      'imgurl': 'i1',
      'date': '1969-07-21 20:18:04Z',
      'author': 'josh'
    },
    {
      'title': 'dfg',
      'imgurl': 'i1',
      'date': '1969-07-22 20:18:04Z',
      'author': 'josh'
    },
    {
      'title': 'fgh',
      'imgurl': 'i1',
      'date': '1969-07-23 20:18:04Z',
      'author': 'josh'
    },
    {
      'title': 'ghj',
      'imgurl': 'i1',
      'date': '1969-07-24 20:18:04Z',
      'author': 'josh'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            BgLayout(
              child: Padding(
                padding: const EdgeInsets.all(CONSTANT.SIZE_XL),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'ข่าว',
                              style: CONSTANT.TEXT_STYLE_TITLE,
                            ),
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
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: CONSTANT.SIZE_MD,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            HilightNewsWidget(
                              hilightData: hilightData,
                            ),
                            Text(
                              'ข่าวทั้งหมด',
                              style: CONSTANT.TEXT_STYLE_HEADING,
                            ),
                            Column(
                                children: newsData
                                    .map((item) => NewsItem(
                                          title: item['title'],
                                          date: item['date'],
                                          author: item['author'],
                                          imgURL: item['imgURL'],
                                        ))
                                    .toList()),
                            SizedBox(
                              height: height * 0.1,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            NavigationBar(currentpage: 'news')
          ],
        ),
      ),
    ));
  }
}
