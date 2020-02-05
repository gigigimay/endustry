import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class PageScrollBody extends StatelessWidget {
  const PageScrollBody({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: height * 0.1, top: CONSTANT.SIZE_MD),
        scrollDirection: Axis.vertical,
        child: child,
      ),
    );
  }
}
