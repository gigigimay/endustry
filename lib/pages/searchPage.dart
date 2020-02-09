import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  var searchNewsData = MOCK_SERVICES;
  var searchServiceData = MOCK_NEWS;
  var searchKnowledgeData = MOCK_NEWS;

  var mode = 'ทั้งหมด';

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      child: PagePadding(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButtonInk(
                    icon: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: CONSTANT.WORD_SEARCH_TH,
                          hintStyle: TextStyle(color: CONSTANT.COLOR_DISABLED)),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    CONSTANT.WORD_ALL_TH,
                    style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
                  ),
                  Text(
                    CONSTANT.WORD_NEWS_TH,
                    style: CONSTANT.TEXT_STYLE_BODY,
                  ),
                  Text(CONSTANT.WORD_SERVICE_TH),
                  Text(CONSTANT.WORD_KNOWLEDGE_TH)
                ],
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
