import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentpage: 'menu'),
      child: Column(
        children: <Widget>[PagePadding(child: TitleText('Menu Page!'))],
      ),
    );
  }
}
