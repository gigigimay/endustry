import 'package:endustry/export.dart';

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
