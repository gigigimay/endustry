import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NewsInPage extends StatefulWidget {
  NewsInPage({Key key, this.newsData}) : super(key: key);
  var newsData;
  @override
  _NewsInPageState createState() => _NewsInPageState();
}

class _NewsInPageState extends State<NewsInPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              BgLayout(
                child: Padding(
                  padding: const EdgeInsets.all(CONSTANT.SIZE_XL),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: CONSTANT.COLOR_PRIMARY,
                                    size: CONSTANT.SIZE_XX,
                                  )),
                              SizedBox(
                                width: CONSTANT.SIZE_MD,
                              ),
                              Text(
                                'ข่าว',
                                style: CONSTANT.TEXT_STYLE_TITLE,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: CONSTANT.SIZE_MD,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: null,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('data'),
                            width: double.infinity,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              NavigationBar(currentpage: 'news')
            ],
          ),
        ),
      ),
    );
  }
}
