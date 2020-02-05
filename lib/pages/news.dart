import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NewsPage extends StatelessWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentpage: 'news'),
      child: Column(
        children: <Widget>[PagePadding(child: TitleText('News page!'))],
      ),
    );
  }
}
