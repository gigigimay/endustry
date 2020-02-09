import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'แก้ไขโปรไฟล์',
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
