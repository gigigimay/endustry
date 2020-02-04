import 'package:endustry/export.dart';
import '../constants.dart' as CONSTANT;

class BgLayout extends StatelessWidget {
  BgLayout({Key key, this.child, this.bgImg = 'assets/images/appbg.png'})
      : super(key: key);
  final child, bgImg;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      width: width,
      height: height,
      child: this.child,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.bgImg),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
