import 'package:endustry/export.dart';
import 'package:endustry/pages/newsIn.dart';
import '../../constants.dart' as CONSTANT;

class NewsItem extends StatelessWidget {
  const NewsItem({Key key, this.newsData}) : super(key: key);

  // final String title, date, author, imgURL;
  final newsData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final dateData = DateTime.parse(newsData['date']);
    final dateString =
        '${dateData.day}.${dateData.month}.${dateData.year} | ${dateData.hour}.${dateData.minute} น.';

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsInPage(
                      newsData: newsData,
                      dateString: dateString,
                    )));
      },
      child: Container(
        height: width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
                height: width * 0.4,
                width: width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple[50],
                ),
                child: FittedBox(fit: BoxFit.contain, child: FlutterLogo())),
            SizedBox(
              width: CONSTANT.SIZE_SM,
            ),
            Container(
              height: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        newsData['title'],
                        style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
                        maxLines: 1,
                      ),
                      Text(
                        dateString,
                        style: TextStyle(
                            fontSize: CONSTANT.FONT_SIZE_BODY,
                            color: CONSTANT.COLOR_PRIMARY),
                      ),
                    ],
                  ),
                  Text(
                    newsData['author'],
                    style: TextStyle(
                      fontSize: CONSTANT.FONT_SIZE_BODY,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
