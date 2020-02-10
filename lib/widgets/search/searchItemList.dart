import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledgeIn.dart';
import 'package:endustry/pages/news/newsIn.dart';
import 'package:endustry/widgets/search/searchItems.dart';

class SearchItemList extends StatelessWidget {
  const SearchItemList(
      {Key key,
      this.mode,
      this.newsResult,
      this.serviceResult,
      this.knowledgeResult})
      : super(key: key);

  final mode;
  final List<News> newsResult;
  final List<Service> serviceResult;
  final List<Knowledge> knowledgeResult;

  List<Widget> getSearchItemList(BuildContext context) {
    List<Widget> listSearchItem = [];

    var newsItems = List<Widget>(),
        serviceItems = List<Widget>(),
        knowledgeItems = List<Widget>();

    if (newsResult.length > 0) {
      newsItems = newsResult.map((item) {
        return SearchItems.searchItemNews(
            NetworkImage('https://picsum.photos/200'), item, 80.0, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsInPage(
                        newsData: item,
                      )));
        });
      }).toList();
    }
    if (serviceResult.length > 0) {
      serviceItems = serviceResult.map((item) {
        return SearchItems.searchItemService(
            NetworkImage('https://picsum.photos/200'), item, 80.0, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ServicePage()));
        });
      }).toList();
    }
    if (knowledgeResult.length > 0) {
      knowledgeItems = knowledgeResult.map((item) {
        return SearchItems.searchItemKnowledge(
            NetworkImage('https://picsum.photos/200'), item, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KnowledgeInPage(
                        knowledgeData: item,
                      )));
        });
      }).toList();
    }

    switch (mode) {
      case CONSTANT.WORD_NEWS_TH:
        listSearchItem = newsItems;
        break;
      case CONSTANT.WORD_SERVICE_TH:
        listSearchItem = serviceItems;

        break;
      case CONSTANT.WORD_KNOWLEDGE_TH:
        listSearchItem = knowledgeItems;
        break;
      default:
        listSearchItem = (newsResult.length > 0
                ? [
                      SearchItems.searchTopic(
                          AssetImage('assets/images/news_white.png'),
                          CONSTANT.WORD_NEWS_TH)
                    ] +
                    newsItems
                : List<Widget>()) +
            (serviceResult.length > 0
                ? [
                      SearchItems.searchTopic(
                          AssetImage('assets/images/service_white.png'),
                          CONSTANT.WORD_SERVICE_TH)
                    ] +
                    serviceItems
                : List<Widget>()) +
            (knowledgeResult.length > 0
                ? [
                      SearchItems.searchTopic(
                          AssetImage('assets/images/know_white.png'),
                          CONSTANT.WORD_KNOWLEDGE_TH)
                    ] +
                    knowledgeItems
                : List<Widget>());
    }

    if (newsResult.length + serviceResult.length + knowledgeResult.length > 0) {
      listSearchItem.add(Container(
        height: CONSTANT.SIZE_MD,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(CONSTANT.BORDER_RADIUS),
                bottomRight: Radius.circular(CONSTANT.BORDER_RADIUS))),
      ));
    }

    return listSearchItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getSearchItemList(context),
    );
  }
}
