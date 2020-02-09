import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/knowledge.dart/knowledge_item.dart';

class KnowledgeListPage extends StatelessWidget {
  const KnowledgeListPage(
      {Key key,
      this.title,
      this.knowledgeData,
      this.favList,
      this.isFavVisible = true})
      : super(key: key);

  final title;
  final List<Knowledge> knowledgeData;
  final favList;
  final isFavVisible;

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
              hasBackArrow: true,
              backArrowFunction: () {
                Navigator.pop(context);
              },
              actionWidget: SearchButton()),
          PageScrollBody(
            child: PagePadding(
                top: 0.0,
                child: Column(
                  children: knowledgeData
                      .map((item) => KnowledgeItem(
                            knowledgeData: item,
                            favStatus: favList.contains(item.id),
                          ))
                      .toList(),
                )),
          )
        ],
      ),
    );
  }
}
