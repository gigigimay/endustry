import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/menu_about.dart';
import 'package:endustry/pages/menu_settings.dart';
import '../widgets/menu/menu_item.dart';
import '../widgets/menu/user_profile.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User userData = MOCK_USER;
    return BgLayout(
      navbar: NavigationBar(currentpage: 'menu'),
      child: Column(
        children: <Widget>[
          PagePadding(
            top: CONSTANT.SIZE_XX,
            child: UserProfile(userData: userData),
          ),
          SizedBox(height: CONSTANT.SIZE_LG),
          Divider(
            color: CONSTANT.COLOR_DISABLED,
            height: 1,
          ),
          SizedBox(height: CONSTANT.SIZE_XX),
          MenuItem(
              icon: Icons.settings,
              text: 'ตั้งค่า',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuSettingPage()));
              }),
          MenuItem(
              icon: Icons.info,
              text: 'เกี่ยวกับกระทรวง',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuAboutPage()));
              }),
          MenuItem(
            iconWidget: Transform.rotate(
              angle: 22 / 7,
              child: Icon(
                Icons.exit_to_app,
                color: CONSTANT.COLOR_PRIMARY,
                size: CONSTANT.SIZE_XX,
              ),
            ),
            text: 'ออกจากระบบ',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
