import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/home/list_group.dart';
import 'package:endustry/widgets/knowledge.dart/knowledge_item.dart';

class KnowledgePage extends StatelessWidget {
  const KnowledgePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BgLayout(
      navbar: NavigationBar(currentpage: 'knowledge'),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListGroup(
              title: 'คลังความรู้แนะนำ',
              items: [],
            ),
            PagePadding(
                child: Column(
              children: [
                '1',
                '1',
                '1',
                '1',
                '1',
                '1',
                '1',
                '1',
                '1',
                '1',
                '1',
                '1',
                '1'
              ].map((item) => KnowledgeItem()).toList(),
            ))
          ],
        ),
      ),
    );
  }
}
