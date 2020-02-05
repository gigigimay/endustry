import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ServicePage extends StatelessWidget {
  const ServicePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentpage: 'service'),
      child: Column(
        children: <Widget>[PagePadding(child: TitleText('Service Page!'))],
      ),
    );
  }
}
