import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledge_in.dart';
import 'package:endustry/pages/news/news_in.dart';
import 'package:endustry/pages/service/service_in.dart';
import 'package:endustry/widgets/search/search_items.dart';

class SearchItemList extends StatelessWidget {
  const SearchItemList(
      {Key key,
      this.mode,
      this.newsResult,
      this.serviceResult,
      this.knowledgeResult,
      this.showBottomComponent = false})
      : super(key: key);

  final mode;
  final List<News> newsResult;
  final List<Service> serviceResult;
  final List<Knowledge> knowledgeResult;
  final bool showBottomComponent;

  List<Widget> getSearchItemList(BuildContext context) {
    List<Widget> listSearchItem = [];

    var newsItems = List<Widget>(),
        serviceItems = List<Widget>(),
        knowledgeItems = List<Widget>();

    if (newsResult.length > 0) {
      newsItems = newsResult.map((item) {
        return SearchItems.searchItemNews(
            item.imgurl != null
                ? NetworkImage(item.imgurl, scale: 1)
                : AssetImage('assets/images/pic.png'),
            item,
            80.0, () {
          Utils.navigatePush(context, NewsInPage(newsData: item));
        });
      }).toList();
    }
    if (serviceResult.length > 0) {
      serviceItems = serviceResult.map((item) {
        return SearchItems.searchItemService(
            item.image != null
                ? AssetImage(item.image)
                : AssetImage('assets/images/pic.png'),
            item,
            80.0, () {
          Utils.navigatePush(context, ServiceInPage(serviceData: item));
        });
      }).toList();
    }
    if (knowledgeResult.length > 0) {
      knowledgeItems = knowledgeResult.map((item) {
        return SearchItems.searchItemKnowledge(item, () {
          Utils.navigatePush(context, KnowledgeInPage(knowledgeData: item));
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

    if (showBottomComponent) {
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
