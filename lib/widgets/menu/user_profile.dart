import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/edit_profile/edit_profile.dart';
import '../../widgets/menu/profile_avatar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key key, @required this.userData}) : super(key: key);

  final User userData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double avatarSize = width * 0.25;
    String userType =
        MOCK_USERTYPES.firstWhere((UserType t) => t.id == userData.typeId).name;

    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(CONSTANT.SIZE_SM),
          child: ProfileAvatar(
            fabIcon: Icon(Icons.edit, size: CONSTANT.SIZE_XL),
            img: userData.img,
            avatarSize: avatarSize,
            fabSize: avatarSize * 0.4,
            fabAction: () async {
              bool edited = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
              if (edited ?? false) Utils.showToast('แก้ไขโปรไฟล์แล้ว');
            },
          ),
        ),
        SizedBox(width: CONSTANT.SIZE_MD),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${userData.firstName} ${userData.lastName}',
              style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
            ),
            SizedBox(height: CONSTANT.SIZE_XS),
            Text(userData.email),
            SizedBox(height: CONSTANT.SIZE_SM),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: CONSTANT.SIZE_XS, horizontal: CONSTANT.SIZE_MD),
              decoration: BoxDecoration(
                  color: CONSTANT.COLOR_BACKGROUND,
                  border: Border.all(color: CONSTANT.COLOR_PRIMARY),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Text(
                userType,
                style: TextStyle(color: CONSTANT.COLOR_PRIMARY),
              ),
            )
          ],
        ),
      ],
    );
  }
}
