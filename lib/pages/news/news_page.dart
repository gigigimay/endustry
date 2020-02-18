import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/news/news_feed.dart';
import 'package:endustry/pages/news/news_in.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  News _newsData;

  PageController _pageController = PageController(initialPage: 0);

  checkPageCtrl() => _pageController.hasClients;

  goToNewsInPage(News newsData) {
    if (checkPageCtrl()) {
      setState(() {
        _newsData = newsData;
      });

      _pageController.jumpToPage(1);
    }
  }

  goBack() {
    if (checkPageCtrl()) {
      _pageController.jumpToPage(0);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
        safeBottom: false,
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            NewsFeedPage(itemOnPressed: goToNewsInPage),
            NewsInPage(
              newsData: _newsData,
              backArrowFunction: goBack,
            )
          ],
        ));
  }
}
