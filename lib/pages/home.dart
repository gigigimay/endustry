import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import '../widgets/home/searchbar.dart';
import '../widgets/home/list_group.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentpage: 'home'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PagePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText('กระทรวง'),
                TitleText('อุตสาหกรรม', fontSize: 50.0, height: 0.8),
                const SizedBox(height: CONSTANT.SIZE_XX),
                SearchBar(),
                const SizedBox(height: CONSTANT.SIZE_MD),
              ],
            ),
          ),
          PageScrollBody(
            child: Column(
              children: <Widget>[
                ListGroup(title: 'การใช้งานล่าสุด', items: MOCK_SERVICES),
                ListGroup(title: 'บริการแนะนำ', items: MOCK_SERVICES),
                ListGroup(title: 'คลังความรู้แนะนำ', items: MOCK_SERVICES),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
