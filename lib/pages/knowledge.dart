import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class KnowledgePage extends StatelessWidget {
  const KnowledgePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stack(
            children: <Widget>[
              Text('knowledge Page'),
              NavigationBar(currentpage: 'knowledge')
            ],
          ),
        ),
      ),
    );
  }
}
