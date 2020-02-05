import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stack(
            children: <Widget>[
              Text('menu Page'),
              NavigationBar(currentpage: 'menu')
            ],
          ),
        ),
      ),
    );
  }
}
