import 'package:endustry/export.dart';
import 'package:endustry/pages/news/news_in.dart';
import '../../constants.dart' as CONSTANT;

class NewsItem extends StatelessWidget {
  const NewsItem({Key key, this.newsData, this.itemOnPressed})
      : super(key: key);

  // final String title, date, author, imgURL;
  final News newsData;
  final Function itemOnPressed;

  onTap() {
    itemOnPressed(newsData);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onTap,
      child: RoundedBox(
          height: width * 0.4,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
                child: RoundedBox(
                  height: width * 0.4,
                  width: width * 0.3,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(newsData.imgurl, scale: 1),
                    placeholder: AssetImage('assets/images/pic.png'),
                  ),
                ),
              ),
              SizedBox(
                width: CONSTANT.SIZE_SM,
              ),
              Expanded(
                child: Container(
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
                            newsData.title,
                            style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            News.getDateTimeString(newsData.date),
                            style: TextStyle(
                                fontSize: CONSTANT.FONT_SIZE_BODY,
                                color: CONSTANT.COLOR_PRIMARY),
                          ),
                        ],
                      ),
                      Text(
                        newsData.author,
                        style: TextStyle(
                          fontSize: CONSTANT.FONT_SIZE_BODY,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
