import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/search/search_field.dart';
import 'package:endustry/widgets/search/search_item_list.dart';
import 'package:endustry/widgets/search/topic_btn_group.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController _scrollController;
  final _textEditingController = TextEditingController();
  String _mode = CONSTANT.WORD_ALL_TH;
  String _searchWord = '';

  @override
  void initState() {
    super.initState();
  }

  var searchNewsData = MOCK_NEWS;
  var searchServiceData = MOCK_SERVICES;
  var searchKnowledgeData = MOCK_KNOWLEDGES;

  void onTabChange(String value) {
    setState(() {
      _mode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var newsResult = List<News>(),
        serviceResult = List<Service>(),
        knowledgeResult = List<Knowledge>();

    // TODO: search for dep name and keywords
    if (_searchWord.isNotEmpty) {
      newsResult = searchNewsData
          .where((item) =>
              item.title.contains(_searchWord) ||
              item.content.contains(_searchWord) ||
              item.author.contains(_searchWord))
          .toList();
      serviceResult = searchServiceData
          .where((item) =>
              item.name.contains(_searchWord) ||
              item.description.contains(_searchWord) ||
              item.depId.contains(_searchWord))
          .toList();
      knowledgeResult = searchKnowledgeData
          .where((item) =>
              item.title.contains(_searchWord) ||
              item.content.contains(_searchWord) ||
              item.author.contains(_searchWord))
          .toList();
    }

    getSerchStatusText() {
      String text = '';
      String none = 'ไม่พบผลลัพธ์';

      int newsL = newsResult.length;
      int serviceL = serviceResult.length;
      int knowledgeL = knowledgeResult.length;

      switch (_mode) {
        case CONSTANT.WORD_NEWS_TH:
          if (newsL == 0) text = none;
          break;
        case CONSTANT.WORD_SERVICE_TH:
          if (serviceL == 0) text = none;
          break;
        case CONSTANT.WORD_KNOWLEDGE_TH:
          if (knowledgeL == 0) text = none;
          break;
        default:
          if (newsL + serviceL + knowledgeL == 0) text = none;
      }

      return text;
    }

    showBottomComponent() {
      int newsL = newsResult.length;
      int serviceL = serviceResult.length;
      int knowledgeL = knowledgeResult.length;

      switch (_mode) {
        case CONSTANT.WORD_NEWS_TH:
          if (newsL == 0) return false;
          break;
        case CONSTANT.WORD_SERVICE_TH:
          if (serviceL == 0) return false;
          break;
        case CONSTANT.WORD_KNOWLEDGE_TH:
          if (knowledgeL == 0) return false;
          break;
        case CONSTANT.WORD_ALL_TH:
          if (newsL + serviceL + knowledgeL == 0) return false;
          break;
      }

      return true;
    }

    return BgLayout(
      child: PagePadding(
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                _searchWord == '' ? 'พิมพ์เพื่อค้นหา' : getSerchStatusText(),
                style: TextStyle(
                    fontSize: CONSTANT.FONT_SIZE_HEAD,
                    fontWeight: FontWeight.w700,
                    color: CONSTANT.COLOR_DISABLED),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
                  child: Column(
                    children: <Widget>[
                      SearchField(
                        textEditingController: _textEditingController,
                        onChange: (text) {
                          setState(() {
                            _searchWord = text;
                          });
                        },
                        onClear: () {
                          setState(() {
                            _textEditingController.clear();
                            _searchWord = _textEditingController.text;
                          });
                        },
                      ),
                      Divider(height: 0),
                      SizedBox(height: CONSTANT.SIZE_SM),
                      TopicBtnGroup(
                        topics: [
                          CONSTANT.WORD_ALL_TH,
                          CONSTANT.WORD_NEWS_TH,
                          CONSTANT.WORD_SERVICE_TH,
                          CONSTANT.WORD_KNOWLEDGE_TH,
                        ],
                        mode: _mode,
                        onChange: onTabChange,
                      ),
                      showBottomComponent()
                          ? Container(
                              color: Colors.white,
                              height: CONSTANT.SIZE_XS,
                              child: Divider(
                                height: 0,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      controller: _scrollController,
                      child: SearchItemList(
                        mode: _mode,
                        newsResult: newsResult,
                        serviceResult: serviceResult,
                        knowledgeResult: knowledgeResult,
                        showBottomComponent: showBottomComponent(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
