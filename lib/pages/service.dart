import 'package:endustry/export.dart';
import '../constants.dart' as CONSTANT;

class ServicePage extends StatelessWidget {
  const ServicePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stack(
            children: <Widget>[
              Text('service Page'),
              Navigationbar(currentpage: 'service')
            ],
          ),
        ),
      ),
    );
  }
}
