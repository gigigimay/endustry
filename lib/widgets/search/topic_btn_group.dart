import 'package:endustry/export.dart';
import 'package:endustry/widgets/search/topic_btn.dart';

class TopicBtnGroup extends StatelessWidget {
  TopicBtnGroup({
    Key key,
    this.mode,
    this.onChange,
    this.topics,
  }) : super(key: key);

  final mode;
  final Function onChange;
  final List<String> topics;

  Widget renderItem(String text) => TopicBtn(
        text: text,
        isActive: text == mode,
        onChange: onChange,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: topics.map(renderItem).toList(),
    );
  }
}
