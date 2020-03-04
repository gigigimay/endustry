import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/menu/language_switcher.dart';
import 'package:endustry/app_info.dart';

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
          ),
          PagePadding(
            child: RoundedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(CONSTANT.SIZE_XL),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.language, color: CONSTANT.COLOR_BODY),
                        SizedBox(width: CONSTANT.SIZE_MD),
                        Expanded(
                            child: Text(
                          'ภาษา',
                          style: CONSTANT.TEXT_STYLE_HEADING,
                        )),
                        LanguageSwitcher(),
                      ],
                    ),
                  ),
                  Divider(height: 1),
                  Padding(
                    padding: EdgeInsets.all(CONSTANT.SIZE_XL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.build, color: CONSTANT.COLOR_BODY),
                            SizedBox(width: CONSTANT.SIZE_MD),
                            Text(
                              'เกี่ยวกับแอปพลิเคชั่น',
                              style: CONSTANT.TEXT_STYLE_HEADING,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: CONSTANT.SIZE_SM,
                            left: CONSTANT.SIZE_XX + CONSTANT.SIZE_MD,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Version ${AppInfo.version}\n'
                                '${AppInfo.size}\nอัพเดทล่าสุด: ${Utils.formatDateTime(AppInfo.latestUpdate)}\nผู้พัฒนา: ${AppInfo.developer}',
                                style:
                                    TextStyle(color: CONSTANT.COLOR_DISABLED),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
