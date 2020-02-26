import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/knowledge/knowledge_item.dart';

class KnowledgeFavPage extends StatelessWidget {
  const KnowledgeFavPage(
      {Key key,
      @required this.favList,
      @required this.knowledgeData,
      this.itemOnPressed,
      this.backArrowFunction})
      : super(key: key);

  final List<Knowledge> knowledgeData;
  final favList;
  final Function itemOnPressed, backArrowFunction;

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentTab: 'knowledge'),
      child: Column(
        children: <Widget>[
          PageAppBar(
              title: 'คลังความรู้ของฉัน',
              hasBackArrow: true,
              backArrowFunction: backArrowFunction,
              actionWidget: SearchButton(
                initMode: CONSTANT.WORD_KNOWLEDGE_TH,
              )),
          PageScrollBody(
            child: PagePadding(
                top: 0.0,
                child: Column(
                  children: knowledgeData
                      .map((item) => KnowledgeItem(
                            knowledgeData: item,
                            favStatus: favList.contains(item.id),
                            itemOnPressed: itemOnPressed,
                          ))
                      .toList(),
                )),
          )
        ],
      ),
    );
  }
}
