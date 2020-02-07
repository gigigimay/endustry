import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
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
              onPressed: () => print('ตั้งค่า')),
          MenuItem(
              icon: Icons.info,
              text: 'เกี่ยวกับกระทรวงอุตสาหกรรม',
              onPressed: () => print('เกี่ยวกับกระทรวงอุตสาหกรรม')),
          MenuItem(
              icon: Icons.input,
              text: 'ออกจากระบบ',
              onPressed: () => print('ออกจากระบบ')),
        ],
      ),
    );
  }
}
