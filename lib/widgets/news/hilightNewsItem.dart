import 'package:endustry/export.dart';
import 'package:endustry/pages/newsIn.dart';
import '../../constants.dart' as CONSTANT;

class HilightNewsItem extends StatelessWidget {
  const HilightNewsItem({Key key, this.title, this.imgURL}) : super(key: key);

  final String title, imgURL;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewsInPage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          height: height * 0.15,
          child: Column(
            children: <Widget>[
              Expanded(child: FlutterLogo()),
              Container(
                width: width - (CONSTANT.SIZE_XL * 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          (CONSTANT.SIZE_MD + CONSTANT.SIZE_SM) / 2),
                      bottomRight: Radius.circular(
                          (CONSTANT.SIZE_MD + CONSTANT.SIZE_SM) / 2)),
                  color: CONSTANT.COLOR_PRIMARY,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CONSTANT.SIZE_MD, vertical: CONSTANT.SIZE_MD),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: CONSTANT.FONT_SIZE_BODY,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
