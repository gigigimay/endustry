import 'package:endustry/export.dart';
import 'package:endustry/widgets/news/hilightNewsWidget.dart';
import 'package:endustry/widgets/news/newsListView.dart';
import '../constants.dart' as CONSTANT;

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
    {'label': 'Hasd', 'imgurl': 'i1'},
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
    print('render');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stack(
            children: <Widget>[
              BgLayout(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(CONSTANT.XL),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('ข่าว'),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.filter_list),
                                  onPressed: () {},
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: CONSTANT.MD,
                        ),
                        HilightNewsWidget(
                          hilightData: hilightData,
                        ),
                        Text('ข่าวทั้งหมด'),
                        NewsListView(
                          newsData: newsData,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Navigationbar(currentpage: 'news')
            ],
          ),
        ),
      ),
    );
  }
}
