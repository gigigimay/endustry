import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/home/list_group.dart';

class KnowledgeItem extends StatelessWidget {
  const KnowledgeItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text('data'), Icon(Icons.star_border)],
          ),
          Container(
            child: Text('data2'),
          )
        ],
      ),
    );
  }
}
