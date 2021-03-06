import 'package:endustry/export.dart';
import '../../constants.dart' as CONSTANT;

class HilightNewsItem extends StatelessWidget {
  const HilightNewsItem({Key key, this.newsData, this.itemOnPressed})
      : super(key: key);

  final News newsData;
  final Function itemOnPressed;

  onTap() {
    itemOnPressed(newsData);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CONSTANT.SIZE_XL),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
              color: Colors.white),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(CONSTANT.BORDER_RADIUS),
                    topRight: Radius.circular(CONSTANT.BORDER_RADIUS),
                  ),
                  child: RoundedBox(
                    height: height,
                    width: width,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: newsData.bannerImage != null
                          ? AssetImage(newsData.bannerImage)
                          : AssetImage(CONSTANT.PIC),
                      placeholder: AssetImage(CONSTANT.PIC),
                    ),
                  ),
                ),
              ),
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
