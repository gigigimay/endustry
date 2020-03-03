import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ContentGroup extends StatelessWidget {
  const ContentGroup({
    Key key,
    @required this.title,
    @required this.children,
    this.onSeeAll,
    this.spacing = CONSTANT.SIZE_XL,
    this.runSpacing = CONSTANT.SIZE_XX,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final Function onSeeAll;
  final double spacing, runSpacing;

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
          spacing: spacing,
          runSpacing: runSpacing,
          direction: Axis.horizontal,
          children: children,
        ),
        SizedBox(height: CONSTANT.SIZE_LG),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
                onTap: onSeeAll,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: CONSTANT.SIZE_LG,
                    ),
                    Text('ดูทั้งหมด', style: CONSTANT.TEXT_STYLE_BODY_PRIMARY),
                    IconButtonInk(
                      onPressed: null,
                      icon: Transform.rotate(
                        angle: 22 / 7,
                        child: Icon(Icons.keyboard_backspace),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
