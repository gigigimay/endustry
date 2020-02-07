import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledgeIn.dart';

class KnowledgeSuggestItem extends StatelessWidget {
  const KnowledgeSuggestItem({Key key, this.knowledgeData}) : super(key: key);

  // final String title, date, author, imgURL;
  final Knowledge knowledgeData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final itemwidth = width * 0.25;
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
          padding: EdgeInsets.all(CONSTANT.SIZE_SM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
                  width: itemwidth,
                  height: width * 0.25,
                  child: FittedBox(
                    child: FlutterLogo(),
                    fit: BoxFit.cover,
                  )),
              Container(
                width: itemwidth,
                child: Text(
                  knowledgeData.title,
                  style: CONSTANT.TEXT_STYLE_BODY,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ));
  }
}
