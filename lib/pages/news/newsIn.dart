import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/page_appbar.dart';

class NewsInPage extends StatefulWidget {
  NewsInPage({Key key, this.newsData}) : super(key: key);
  News newsData;

  @override
  _NewsInPageState createState() => _NewsInPageState();
}

class _NewsInPageState extends State<NewsInPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(widget.newsData);
    return BgLayout(
      navbar: NavigationBar(currentpage: 'news'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'ข่าว',
            haveBackArrow: true,
            backArrowFunction: () {
              Navigator.pop(context);
            },
          ),
          PageScrollBody(
            child: PagePadding(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
                child: Padding(
                  padding: const EdgeInsets.all(CONSTANT.SIZE_MD),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        widget.newsData.title,
                        style: CONSTANT.TEXT_STYLE_HEADING,
                      ),
                      SizedBox(
                        height: CONSTANT.SIZE_SM,
                      ),
                      Text(
                        News.getDateTimeString(widget.newsData.date),
                        style: TextStyle(
                            color: CONSTANT.COLOR_PRIMARY,
                            fontSize: CONSTANT.FONT_SIZE_BODY),
                      ),
                      Text(
                        widget.newsData.author,
                        style: TextStyle(
                          fontSize: CONSTANT.FONT_SIZE_BODY,
                        ),
                      ),
                      SizedBox(
                        height: CONSTANT.SIZE_SM,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(CONSTANT.BORDER_RADIUS),
                            color: Colors.purple[50]),
                        height: height * 0.24,
                        child: FittedBox(
                            fit: BoxFit.contain, child: FlutterLogo()),
                      ),
                      SizedBox(
                        height: CONSTANT.SIZE_LG,
                      ),
                      Text(
                        'เนื้อหาข่าว',
                        style: TextStyle(
                            fontSize: CONSTANT.FONT_SIZE_BODY,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget.newsData.content,
                        style: CONSTANT.TEXT_STYLE_BODY,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
