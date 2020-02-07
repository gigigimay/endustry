import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledgeIn.dart';
import 'package:endustry/widgets/home/list_group.dart';

class KnowledgeItem extends StatelessWidget {
  const KnowledgeItem({Key key, this.knowledgeData}) : super(key: key);

  // final String title, date, author, imgURL;
  final Knowledge knowledgeData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KnowledgeInPage(
                        knowledgeData: knowledgeData,
                      )));
        },
        child: Container(
          height: 100,
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
                  Text(
                    knowledgeData.title,
                    style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Icon(
                    knowledgeData.fav ? Icons.star : Icons.star_border,
                    color: CONSTANT.COLOR_PRIMARY,
                    size: CONSTANT.SIZE_XL,
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
