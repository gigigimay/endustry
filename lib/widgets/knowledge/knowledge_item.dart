import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledge_in.dart';

class KnowledgeItem extends StatelessWidget {
  const KnowledgeItem({
    Key key,
    this.knowledgeData,
    @required this.favStatus,
    this.itemOnPressed,
  }) : super(key: key);

  final Knowledge knowledgeData;
  final bool favStatus;

  final Function itemOnPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Utils.navigatePush(
              context,
              KnowledgeInPage(
                knowledgeData: knowledgeData,
              ),
            ),
        child: Container(
          padding: EdgeInsets.all(CONSTANT.SIZE_MD),
          margin: EdgeInsets.symmetric(vertical: CONSTANT.SIZE_SM),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      knowledgeData.title,
                      style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    favStatus ? Icons.star : Icons.star_border,
                    color: CONSTANT.COLOR_PRIMARY,
                    size: CONSTANT.SIZE_LG + 2.0,
                  )
                ],
              ),
              Container(
                child: Text(
                  knowledgeData.content,
                  style: CONSTANT.TEXT_STYLE_BODY,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ));
  }
}
