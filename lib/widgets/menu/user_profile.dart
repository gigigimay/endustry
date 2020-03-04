import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/edit_profile/edit_profile.dart';
import 'package:endustry/storage.dart';
import '../../widgets/menu/profile_avatar.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User _userData;
  @override
  void initState() {
    _userData = Storage.user;
    super.initState();
  }

  onEditPressed() async {
    bool edited = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditProfilePage()));
    if (edited ?? false) {
      Utils.showToast('แก้ไขโปรไฟล์แล้ว');
      setState(() {
        _userData = Storage.user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double avatarSize = width * 0.25;
    String userType = MOCK_USERTYPES
        .firstWhere((UserType t) => t.id == _userData.typeId)
        .name;
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(CONSTANT.SIZE_SM),
          child: ProfileAvatar(
            fabIcon: Icon(
              Icons.edit,
              size: CONSTANT.SIZE_XL,
            ),
            img: NetworkImage(_userData.img),
            avatarSize: avatarSize,
            fabSize: avatarSize * 0.4,
            fabAction: onEditPressed,
          ),
        ),
        SizedBox(width: CONSTANT.SIZE_MD),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${_userData.firstName} ${_userData.lastName}',
                style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: CONSTANT.SIZE_XS),
              Text(_userData.email),
              SizedBox(height: CONSTANT.SIZE_SM),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: CONSTANT.SIZE_XS, horizontal: CONSTANT.SIZE_MD),
                decoration: BoxDecoration(
                  color: CONSTANT.COLOR_BACKGROUND,
                  border: Border.all(color: CONSTANT.COLOR_PRIMARY),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Text(
                  userType,
                  style: TextStyle(color: CONSTANT.COLOR_PRIMARY),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
