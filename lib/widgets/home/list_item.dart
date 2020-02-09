import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class Item extends StatelessWidget {
  const Item({Key key, this.itemWidth, this.label}) : super(key: key);
  final itemWidth, label;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(CONSTANT.SIZE_SM),
      onPressed: () {
        print('pressed! ${this.label}');
      },
      child: Container(
        width: this.itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RoundedBox(
              width: this.itemWidth,
              height: this.itemWidth,
            ),
            const SizedBox(height: CONSTANT.SIZE_SM),
            Text(
              this.label,
              style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
