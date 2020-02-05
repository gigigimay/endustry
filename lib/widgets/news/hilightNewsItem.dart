import 'package:endustry/export.dart';
import '../../constants.dart' as CONSTANT;

class HilightNewsItem extends StatelessWidget {
  const HilightNewsItem({Key key, this.title, this.imgURL}) : super(key: key);

  final String title, imgURL;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((CONSTANT.MD + CONSTANT.SM) / 2),
          color: Colors.red,
        ),
        height: height * 0.15,
        child: Column(
          children: <Widget>[
            Expanded(child: FlutterLogo()),
            Container(
              width: width - (CONSTANT.XL * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular((CONSTANT.MD + CONSTANT.SM) / 2),
                    bottomRight:
                        Radius.circular((CONSTANT.MD + CONSTANT.SM) / 2)),
                color: CONSTANT.COLOR_PRIMARY,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CONSTANT.MD, vertical: CONSTANT.SM),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
