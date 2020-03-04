import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledge_in.dart';
import 'package:endustry/widgets/knowledge/fav_button.dart';

class KnowledgeItem extends StatelessWidget {
  const KnowledgeItem(
      {Key key, this.knowledgeData, this.itemOnPressed, this.favOnPressed})
      : super(key: key);

  final Knowledge knowledgeData;

  final Function itemOnPressed;
  final Function favOnPressed;

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
                  FavButton(
                    knwId: knowledgeData.id,
                  )
                ],
              ),
              Container(
                child: Text(
                  knowledgeData.content ?? '',
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
