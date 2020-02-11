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

  @override
  void initState() {
    super.initState();
  }

  var searchNewsData = MOCK_NEWS;
  var searchServiceData = MOCK_SERVICES;
  var searchKnowledgeData = MOCK_KNOWLEDGE;

  var mode = CONSTANT.WORD_ALL_TH;

  var searchWord = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var newsResult = List<News>(),
        serviceResult = List<Service>(),
        knowledgeResult = List<Knowledge>();

    if (searchWord.isNotEmpty) {
      newsResult = searchNewsData
          .where((item) => item.title.contains(searchWord))
          .toList();
      serviceResult = searchServiceData
          .where((item) => item.name.contains(searchWord))
          .toList();
      knowledgeResult = searchKnowledgeData
          .where((item) => item.title.contains(searchWord))
          .toList();
    }

    getSerchStatusText() {
      String text = '';
      String none = 'ไม่พบผลลัพธ์';

      int newsL = newsResult.length;
      int serviceL = serviceResult.length;
      int knowledgeL = knowledgeResult.length;

      switch (mode) {
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

      switch (mode) {
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
              // TODO: แก้ word
              child: Text(
                searchWord == '' ? 'แพรอ้วน & เมอ้วน' : getSerchStatusText(),
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
                            searchWord = text;
                          });
                        },
                        onClear: () {
                          setState(() {
                            _textEditingController.clear();
                            searchWord = _textEditingController.text;
                          });
                        },
                      ),
                      Divider(
                        height: 0,
                      ),
                      SizedBox(
                        height: CONSTANT.SIZE_SM,
                      ),
                      TopicBtnGroup(
                        mode: mode,
                        state: this,
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
                        mode: mode,
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
