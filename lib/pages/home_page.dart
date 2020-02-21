import 'package:endustry/export.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.changePage}) : super(key: key);

  final Function changePage;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Knowledge> _allKnowledgeData, _suggestKnowledgeData, _favKnowledgeData;
  List _favList;
  Knowledge _knowledgeData;

  int _prevPage;

  PageController _pageController = PageController(initialPage: 0);

  checkPageCtrl() => _pageController.hasClients;

  goToKnowFavPage() {
    if (checkPageCtrl()) {
      _prevPage = _pageController.page.toInt();
      _pageController.jumpToPage(1);
    }
  }

  goToInPage(data) {
    if (checkPageCtrl()) {
      setState(() {
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // TODO: Init Data here
    _favList = MOCK_USER.favKnowledges;
    _allKnowledgeData = MOCK_KNOWLEDGES;
    _suggestKnowledgeData = MOCK_KNOWLEDGES.reversed.toList();
    _favKnowledgeData =
        _allKnowledgeData.where((item) => _favList.contains(item.id)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
        safeTop: false,
        safeBottom: false,
        navbar: NavigationBar(
          currentpage: 'home',
          backToFirstPage: goBackToFirst,
          changeTopicPage: widget.changePage,
        ),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[HomeFeedPage()],
        ));
  }
}
