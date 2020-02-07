import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(CONSTANT.SIZE_SM),
          child: Container(
            width: width * 0.25,
            height: width * 0.25,
            decoration: BoxDecoration(
                border: Border.all(
                    color: CONSTANT.COLOR_BORDER_LIGHT,
                    width: CONSTANT.BORDER_WIDTH_THICK),
                borderRadius: BorderRadius.circular(50),
                color: Colors.white),
          ),
        ),
        SizedBox(width: CONSTANT.SIZE_MD),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'แพร อ้วนนะ!',
              style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
            ),
            SizedBox(height: CONSTANT.SIZE_XS),
            Text('nani@gmail.com'),
            SizedBox(height: CONSTANT.SIZE_SM),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: CONSTANT.SIZE_XS, horizontal: CONSTANT.SIZE_MD),
              decoration: BoxDecoration(
                  color: CONSTANT.COLOR_BACKGROUND,
                  border: Border.all(color: CONSTANT.COLOR_PRIMARY),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Text(
                'ผู้ประกอบการ',
                style: TextStyle(color: CONSTANT.COLOR_PRIMARY),
              ),
            )
          ],
        ),
      ],
    );
  }
}
