import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/menu/box_layout.dart';
import 'package:endustry/widgets/menu/profile_avatar.dart';
import 'package:endustry/widgets/menu/edit_button.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final User userData = MOCK_USER;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final double avatarSize = width * 0.4;

    String userType =
        MOCK_USERTYPES.firstWhere((UserType t) => t.id == userData.typeId).name;

    return BoxLayout(
      title: 'แก้ไขโปรไฟล์',
      topOverlap: avatarSize / 2,
      bottomOverlap: CONSTANT.FONT_SIZE_HEAD + CONSTANT.SIZE_XS,
      topWidget: ProfileAvatar(
        imgUrl: userData.imgUrl,
        avatarSize: avatarSize,
        fabSize: avatarSize * 0.3,
        fabIcon: Icon(Icons.camera_alt),
        fabAction: () => print('edit image!'),
      ),
      bottomWidget: GradientButton(
        text: 'บันทึก',
        onTap: () => print('save!'),
      ),
      // TODO: submit form
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            PageScrollBody(
              child: Column(
                children: <Widget>[
                  MyTextField(
                    hintText: 'ชื่อ',
                    initialValue: userData.firstName,
                  ),
                  MyTextField(
                    hintText: 'นามสกุล',
                    initialValue: userData.lastName,
                  ),
                  MyTextField(
                    hintText: 'อีเมล์',
                    initialValue: userData.email,
                  ),
                  MyTextField(
                    initialValue: '••••••••••',
                    isPassword: true,
                  ),
                  SizedBox(height: CONSTANT.SIZE_XX),
                  // TODO: click to open dropdown, change structure of data
                  MyDropdown(title: 'คุณคือ', valueLabel: userType, items: []),
                  SizedBox(height: CONSTANT.SIZE_XL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('สิ่งที่คุณสนใจ',
                          style: CONSTANT.TEXT_STYLE_HEADING),
                      EditButton(onTap: () => print('tap'))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
