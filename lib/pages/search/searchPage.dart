import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/search/searchItemList.dart';
import 'package:endustry/widgets/search/searchfield.dart';
import 'package:endustry/widgets/search/topicBtnGroup.dart';

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

    return BgLayout(
      child: PagePadding(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
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
                    Divider(
                      height: CONSTANT.SIZE_LG,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: Container(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      controller: _scrollController,
                      child: SearchItemList(
                        mode: mode,
                        newsResult: searchNewsData
                            .where((item) => item.title.contains(searchWord))
                            .toList(),
                        serviceResult: searchServiceData
                            .where((item) => item.name.contains(searchWord))
                            .toList(),
                        knowledgeResult: searchKnowledgeData
                            .where((item) => item.title.contains(searchWord))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO: custom scrollbar

// Draggable(
//   axis: Axis.vertical,
//   feedback: Container(
//     decoration: BoxDecoration(color: CONSTANT.COLOR_PRIMARY),
//     height: 100,
//     width: 10,
//   ),
//   child: Container(
//     decoration: BoxDecoration(color: CONSTANT.COLOR_PRIMARY),
//     height: 100,
//     width: 10,
//   ),
//   childWhenDragging: Container(
//     decoration: BoxDecoration(color: Colors.transparent),
//     height: 100,
//     width: 10,
//   ),
// ),
