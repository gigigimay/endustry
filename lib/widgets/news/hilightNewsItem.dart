import 'package:endustry/export.dart';
import 'package:endustry/pages/newsIn.dart';
import '../../constants.dart' as CONSTANT;

class HilightNewsItem extends StatelessWidget {
  const HilightNewsItem({Key key, this.newsData}) : super(key: key);

  final News newsData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsInPage(
                      newsData: newsData,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CONSTANT.SIZE_XL),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS), color: Colors.white),
          child: Column(
            children: <Widget>[
              Expanded(child: FlutterLogo()),
              Container(
                width: width - (CONSTANT.SIZE_XL * 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(CONSTANT.BORDER_RADIUS),
                    bottomRight: Radius.circular(CONSTANT.BORDER_RADIUS),
                  ),
                  color: CONSTANT.COLOR_PRIMARY,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CONSTANT.SIZE_MD, vertical: CONSTANT.SIZE_MD),
                  child: Text(
                    newsData.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: CONSTANT.FONT_SIZE_BODY,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
