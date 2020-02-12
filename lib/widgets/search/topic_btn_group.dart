import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/search/topic_btn.dart';

class TopicBtnGroup extends StatelessWidget {
  TopicBtnGroup({Key key, this.mode, this.state}) : super(key: key);

  final mode;
  var state;

  getTextStyleByMode(compareMode) => mode == compareMode
      ? CONSTANT.TEXT_STYLE_BODY_PRIMARY
      : TextStyle(fontSize: CONSTANT.SIZE_LG, fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TopicBtn(
          text: CONSTANT.WORD_ALL_TH,
          style: getTextStyleByMode(CONSTANT.WORD_ALL_TH),
          onPressed: () {
            state.setState(() {
              state.mode = CONSTANT.WORD_ALL_TH;
            });
          },
        ),
        TopicBtn(
          text: CONSTANT.WORD_NEWS_TH,
          style: getTextStyleByMode(CONSTANT.WORD_NEWS_TH),
          onPressed: () {
            state.setState(() {
              state.mode = CONSTANT.WORD_NEWS_TH;
            });
          },
        ),
        TopicBtn(
          text: CONSTANT.WORD_SERVICE_TH,
          style: getTextStyleByMode(CONSTANT.WORD_SERVICE_TH),
          onPressed: () {
            state.setState(() {
              state.mode = CONSTANT.WORD_SERVICE_TH;
            });
          },
        ),
        TopicBtn(
          text: CONSTANT.WORD_KNOWLEDGE_TH,
          style: getTextStyleByMode(CONSTANT.WORD_KNOWLEDGE_TH),
          onPressed: () {
            state.setState(() {
              state.mode = CONSTANT.WORD_KNOWLEDGE_TH;
            });
          },
        ),
      ],
    );
  }
}
