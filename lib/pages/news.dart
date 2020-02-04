import 'package:endustry/export.dart';
import '../constants.dart' as CONSTANT;

class NewsPage extends StatelessWidget {
  const NewsPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stack(
            children: <Widget>[
              Text('News Page'),
              NavigationBar(currentpage: 'news')
            ],
          ),
        ),
      ),
    );
  }
}
