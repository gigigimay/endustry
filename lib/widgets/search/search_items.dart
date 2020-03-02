import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class SearchItems {
  static Widget searchTopic(ImageProvider img, text) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
          vertical: CONSTANT.SIZE_MD, horizontal: CONSTANT.SIZE_XL),
      child: Row(
        children: <Widget>[
          ImageIcon(
            img,
            color: Colors.black,
          ),
          SizedBox(
            width: CONSTANT.SIZE_MD,
          ),
          Text(
            text,
            style: CONSTANT.TEXT_STYLE_HEADING,
          )
        ],
      ),
    );
  }

  static Widget searchItemNews(ImageProvider img, News data, size, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
              vertical: CONSTANT.SIZE_SM, horizontal: CONSTANT.SIZE_XL),
          child: Row(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
              child: Container(
                height: size,
                width: size,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image(image: img),
                ),
              ),
            ),
            SizedBox(
              width: CONSTANT.SIZE_SM,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
                  ),
                  Text(
                    '${data.getDateString()} | ${data.author}',
                    style: CONSTANT.TEXT_STYLE_BODY,
                  ),
                ],
              ),
            )
          ])),
    );
  }

  static Widget searchItemService(
      ImageProvider img, Service data, size, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
              vertical: CONSTANT.SIZE_SM, horizontal: CONSTANT.SIZE_XL),
          child: Row(children: <Widget>[
            ClipOval(
              child: Container(
                height: size,
                width: size,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image(image: img),
                ),
              ),
            ),
            SizedBox(
              width: CONSTANT.SIZE_SM,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
                  ),
                  Text(
                    data.depId,
                    style: CONSTANT.TEXT_STYLE_BODY,
                  ),
                ],
              ),
            )
          ])),
    );
  }

  static Widget searchItemKnowledge(Knowledge data, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
              vertical: CONSTANT.SIZE_SM, horizontal: CONSTANT.SIZE_XL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
              ),
              Text(
                data.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CONSTANT.TEXT_STYLE_BODY,
              ),
            ],
          )),
    );
  }
}
