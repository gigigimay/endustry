import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/menu/menu_about.dart';
import 'package:endustry/pages/menu/menu_settings.dart';
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/menu/logout_confirm_dialog.dart';
import '../../widgets/menu/menu_item.dart';
import '../../widgets/menu/user_profile.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key, this.changePage, this.goBackToFirst})
      : super(key: key);

  final Function goBackToFirst, changePage;

  Function onLogout(context) => () async {
        bool confirm = await showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return LogoutConfirmDialog();
            });
        if (confirm ?? false) {
          await Storage().logout();
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (Route<dynamic> route) => false);
        }
      };

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      navbar: NavigationBar(currentTab: 'menu', isOnRoot: true),
      child: Column(
        children: <Widget>[
          PagePadding(
            top: CONSTANT.SIZE_XX,
            child: UserProfile(),
          ),
          SizedBox(height: CONSTANT.SIZE_LG),
          Divider(color: CONSTANT.COLOR_DISABLED),
          SizedBox(height: CONSTANT.SIZE_MD),
          MenuItem(
            icon: Icons.settings,
            text: 'ตั้งค่า',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuSettingPage()));
            },
          ),
          MenuItem(
            icon: Icons.info,
            text: 'เกี่ยวกับกระทรวง',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuAboutPage()));
            },
          ),
          MenuItem(
            iconWidget: Container(
              width: CONSTANT.SIZE_XX,
              height: CONSTANT.SIZE_XX,
              padding: EdgeInsets.only(top: 2, left: 3, right: 2, bottom: 2),
              child: ImageIcon(AssetImage('assets/images/logout.png')),
            ),
            text: 'ออกจากระบบ',
            onPressed: onLogout(context),
          )
        ],
      ),
    );
  }
}
