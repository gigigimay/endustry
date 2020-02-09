import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/menu/edit_profile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key key, @required this.userData}) : super(key: key);

  final User userData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double avatarSize = width * 0.25;
    double editSize = avatarSize * 0.4;
    String userType =
        MOCK_USERTYPES.firstWhere((UserType t) => t.id == userData.typeId).name;

    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(CONSTANT.SIZE_SM),
          child: Stack(children: <Widget>[
            Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: CONSTANT.COLOR_BORDER_LIGHT,
                      width: CONSTANT.BORDER_WIDTH_THICK),
                  borderRadius: BorderRadius.circular(999)),
              child: CircleAvatar(
                  radius: 999, backgroundImage: NetworkImage(userData.imgUrl)),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: editSize,
                height: editSize,
                child: FittedBox(
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()));
                      },
                      backgroundColor: CONSTANT.COLOR_PRIMARY,
                      elevation: 0,
                      child:
                          Transform.scale(scale: 1.2, child: Icon(Icons.edit))),
                ),
              ),
            )
          ]),
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
