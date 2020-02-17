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

  isFoundResult(newsL, serviceL, knowledgeL) {
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

  getNewsFromSearch(searchNewsData) => searchNewsData
      .where((item) =>
          item.title.contains(_searchWord) ||
          item.content.contains(_searchWord) ||
          item.author.contains(_searchWord))
      .toList();

  // TODO: search for dep name and keywords
  getServiceFromSearch(searchServiceData) => searchServiceData
      .where((item) =>
          item.name.contains(_searchWord) ||
          item.description.contains(_searchWord) ||
          item.depId.contains(_searchWord))
      .toList();

  getKnowledgeFromSearch(searchServiceData) => searchKnowledgeData
      .where((item) =>
          item.title.contains(_searchWord) ||
          item.content.contains(_searchWord) ||
          item.author.contains(_searchWord))
      .toList();

  @override
  Widget build(BuildContext context) {
    var newsResult = _searchWord.isNotEmpty
            ? getNewsFromSearch(searchNewsData)
            : List<News>(),
        serviceResult = _searchWord.isNotEmpty
            ? getServiceFromSearch(searchServiceData)
            : List<Service>(),
        knowledgeResult = _searchWord.isNotEmpty
            ? getKnowledgeFromSearch(searchServiceData)
            : List<Knowledge>();

    final _isFoundResult = isFoundResult(
        newsResult.length, serviceResult.length, knowledgeResult.length);

    return BgLayout(
      child: PagePadding(
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                _searchWord == ''
                    ? 'พิมพ์เพื่อค้นหา'
                    : _isFoundResult ? '' : 'ไม่พบผลลัพธ์',
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
                      _isFoundResult
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
                        showBottomComponent: _isFoundResult,
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
