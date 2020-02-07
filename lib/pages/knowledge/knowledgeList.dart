import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/knowledge.dart/knowledge_item.dart';
import 'package:endustry/widgets/page_appbar.dart';

class KnowledgeListPage extends StatelessWidget {
  const KnowledgeListPage({Key key, this.title, this.knowledgeData})
      : super(key: key);

  final title;
  final List<Knowledge> knowledgeData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BgLayout(
      navbar: NavigationBar(currentpage: 'knowledge'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: title,
            haveBackArrow: true,
            backArrowFunction: () {
              Navigator.pop(context);
            },
            actionWidget: Material(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: InkWell(
                customBorder: CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                onTap: (){},
              ),
            ),
          ),
          PageScrollBody(
            child: PagePadding(
                top: 0.0,
                child: Column(
                  children: knowledgeData
                      .map((item) => KnowledgeItem(
                            knowledgeData: item,
                          ))
                      .toList(),
                )),
          )
        ],
      ),
    );
  }
}
