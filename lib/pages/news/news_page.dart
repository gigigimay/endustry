import 'package:endustry/export.dart';
import 'package:endustry/pages/news/news_feed.dart';
import 'package:endustry/pages/news/news_in.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key, this.changePage}) : super(key: key);

  final Function changePage;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  News _newsData;
  int _prevPage;
  String _selectedFilter;

  PageController _pageController = PageController(initialPage: 0);

  checkPageCtrl() => _pageController.hasClients;

  goToNewsInPage(News newsData) {
    if (checkPageCtrl()) {
      setState(() {
        _newsData = newsData;
        _prevPage = _pageController.page.toInt();
      });

      _pageController.jumpToPage(2);
    }
  }

  goBack() {
    if (checkPageCtrl()) {
      _pageController.jumpToPage(_prevPage);
    }
  }

  goBackToFirst() {
    if (checkPageCtrl()) {
      _pageController.jumpToPage(0);
    }
  }

  setFilter(newFilter) {
    if (checkPageCtrl()) {
      _pageController.jumpToPage(1);
      setState(() {
        _selectedFilter = newFilter;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
        safeBottom: false,
        navbar: NavigationBar(
          currentpage: 'news',
          backToFirstPage: goBackToFirst,
          changeTopicPage: widget.changePage,
        ),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            NewsFeedPage(
              itemOnPressed: goToNewsInPage,
              selectedFilter: "ข่าวทั้งหมด",
              setFilter: setFilter,
            ),
            NewsFeedPage(
              itemOnPressed: goToNewsInPage,
              selectedFilter: _selectedFilter,
              setFilter: setFilter,
            ),
            NewsInPage(
              newsData: _newsData,
              backArrowFunction: goBackToFirst,
            )
          ],
        ));
  }
}
