import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NewsInPage extends StatefulWidget {
  NewsInPage({Key key, this.newsData, this.backArrowFunction})
      : super(key: key);
  final News newsData;
  final backArrowFunction;

  @override
  _NewsInPageState createState() => _NewsInPageState();
}

class _NewsInPageState extends State<NewsInPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BgLayout(
      navbar: NavigationBar(currentpage: 'news'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'ข่าว',
            hasBackArrow: true,
            backArrowFunction: widget.backArrowFunction,
          ),
          PageScrollBody(
            child: PagePadding(
              child: RoundedBox(
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
                      RoundedBox(
                        color: Colors.white,
                        height: height * 0.24,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(CONSTANT.BORDER_RADIUS),
                          child: FadeInImage(
                            width: width,
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.newsData.imgurl),
                            placeholder:
                                AssetImage('assets/images/news_white.png'),
                          ),
                        ),
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
