import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/page_appbar.dart';

class MenuSettingPage extends StatelessWidget {
  const MenuSettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'ตั้งค่า',
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
