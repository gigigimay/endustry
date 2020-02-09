import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/page_appbar.dart';

class MenuAboutPage extends StatelessWidget {
  const MenuAboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'เกี่ยวกับกระทรวง',
            hasBackArrow: true,
            backArrowFunction: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
