import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledgeList.dart';
import 'package:endustry/widgets/home/list_group.dart';
import 'package:endustry/widgets/knowledge.dart/knowledge_item.dart';
import 'package:endustry/widgets/knowledge.dart/knowledge_suggest_item.dart';
import 'package:endustry/widgets/page_appbar.dart';

class KnowledgePage extends StatelessWidget {
  const KnowledgePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

// รอรับค่าจากข้างนอก
    final suggestKnowledgeData = MOCK_KNOWLEDGE;
    final knowledgeData = MOCK_KNOWLEDGE;

    return BgLayout(
      navbar: NavigationBar(currentpage: 'knowledge'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'คลังความรู้',
            actionWidget: Row(
              children: <Widget>[
                SearchButton(),
                IconButtonInk(
                  icon: ImageIcon(
                    AssetImage('assets/images/fav.png'),
                    color: CONSTANT.COLOR_PRIMARY,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KnowledgeListPage(
                                  title: 'คลังความรู้ของฉัน',
                                  knowledgeData: knowledgeData
                                      .where((item) => item.fav)
                                      .toList(),
                                )));
                  },
                ),
              ],
            ),
          ),
          PageScrollBody(
            child: Column(
              children: <Widget>[
                ListGroup(
                  title: 'คลังความรู้แนะนำ',
                  items: suggestKnowledgeData
                      .map((item) => KnowledgeSuggestItem(
                            knowledgeData: item,
                          ))
                      .toList(),
                  goto: KnowledgeListPage(
                    title: 'คลังความรู้แนะนำ',
                    knowledgeData: suggestKnowledgeData,
                    isFavVisible: false,
                  ),
                ),
                PagePadding(
                    top: 0.0,
                    child: Column(
                      children: MOCK_KNOWLEDGE
                          .map((item) => KnowledgeItem(
                                knowledgeData: item,
                              ))
                          .toList(),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
