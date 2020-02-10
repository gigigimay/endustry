
import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ContentGroup extends StatelessWidget {
  const ContentGroup({
    Key key,
    @required this.title,
    @required this.children,
    this.onSeeAll,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final Function onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: CONSTANT.TEXT_STYLE_HEADING,
        ),
        SizedBox(height: CONSTANT.SIZE_LG),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: CONSTANT.SIZE_LG,
          runSpacing: CONSTANT.SIZE_LG,
          direction: Axis.horizontal,
          children: children,
        ),
        SizedBox(height: CONSTANT.SIZE_LG),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('ดูทั้งหมด', style: CONSTANT.TEXT_STYLE_BODY_PRIMARY),
            IconButtonInk(
              onTap: onSeeAll ?? () => print('see all'),
              icon: Transform.rotate(
                angle: 22 / 7,
                child: Icon(Icons.keyboard_backspace),
              ),
            )
          ],
        )
      ],
    );
  }
}
