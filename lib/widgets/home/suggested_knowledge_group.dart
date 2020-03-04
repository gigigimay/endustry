import 'package:endustry/export.dart';
import 'package:endustry/pages/knowledge/knowledge_in.dart';
import 'package:endustry/widgets/home/content_group.dart';
import 'package:endustry/widgets/knowledge/knowledge_item.dart';

class SuggestedKnowledgeGroup extends StatelessWidget {
  const SuggestedKnowledgeGroup({
    Key key,
    @required this.suggestedKnowledgesData,
    @required this.currentTab,
    this.maxItems = 3,
  }) : super(key: key);

  final List<Knowledge> suggestedKnowledgesData;
  final String currentTab;
  final int maxItems;

  @override
  Widget build(BuildContext context) {
    final int length = suggestedKnowledgesData.length;
    if (length == 0) return Container();
    return ContentGroup(
      title: 'คลังความรู้แนะนำ',
      spacing: 0,
      runSpacing: 0,
      onSeeAll: () {
        Utils.navigatePush(context, KnowledgePage());
      },
      children: suggestedKnowledgesData
          .sublist(0, length < maxItems ? length : maxItems)
          .map((Knowledge item) => KnowledgeItem(
                knowledgeData: item,
                itemOnPressed: () => Utils.navigatePush(
                    context,
                    KnowledgeInPage(
                      knowledgeData: item,
                      currentTab: currentTab,
                    )),
              ))
          .toList(),
    );
  }
}
