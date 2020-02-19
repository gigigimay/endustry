import 'package:endustry/export.dart';
import 'package:endustry/pages/knowledge/knowledge_fav.dart';
import 'package:endustry/pages/knowledge/knowledge_feed.dart';
import 'package:endustry/pages/knowledge/knowledge_in.dart';

class KnowledgePage extends StatefulWidget {
  KnowledgePage({Key key}) : super(key: key);

  @override
  _KnowledgePageState createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
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

  goToKnowInPage(Knowledge knowledgeData) {
    if (checkPageCtrl()) {
      setState(() {
        _knowledgeData = knowledgeData;
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
        safeBottom: false,
        navbar: NavigationBar(currentpage: 'knowledge'),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            KnowledgeFeedPage(
                goToKnowFavPage: goToKnowFavPage,
                itemOnPressed: goToKnowInPage),
            KnowledgeFavPage(
              favList: _favList,
              knowledgeData: _favKnowledgeData,
              itemOnPressed: goToKnowInPage,
              backArrowFunction: goBack,
            ),
            KnowledgeInPage(
              knowledgeData: _knowledgeData,
              backArrowFunction: goBack,
            )
          ],
        ));
  }
}
