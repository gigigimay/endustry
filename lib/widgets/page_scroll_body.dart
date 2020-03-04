import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class PageScrollBody extends StatelessWidget {
  const PageScrollBody({
    Key key,
    this.child,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.controller,
  }) : super(key: key);
  final Widget child;
  final ScrollPhysics physics;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: SingleChildScrollView(
        controller: controller,
        physics: physics,
        padding: EdgeInsets.only(bottom: height * 0.1, top: CONSTANT.SIZE_MD),
        scrollDirection: Axis.vertical,
        child: child,
      ),
    );
  }
}
