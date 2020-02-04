import 'package:endustry/export.dart';
import '../constants.dart' as CONSTANT;
import '../widgets/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BgLayout(
            child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  CONSTANT.XL, CONSTANT.MD, CONSTANT.XL, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TitleText('กระทรวง'),
                      TitleText('อุตสาหกรรม', fontSize: 50.0, height: 0.8),
                    ],
                  ),
                  const SizedBox(height: CONSTANT.XX),
                  SearchBar(),
                ],
              ),
            ),
            Navigationbar(
              currentpage: 'home',
            )
          ],
        )),
      ),
    );
  }
}
