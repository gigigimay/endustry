import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/menu/profile_avatar.dart';
import 'package:endustry/widgets/menu/edit_button.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final User userData = MOCK_USER;
  final List<Keyword> keywordsData = MOCK_KEYWORDS;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double avatarSize = width * 0.4;

    String userType =
        MOCK_USERTYPES.firstWhere((UserType t) => t.id == userData.typeId).name;

    List<String> keywords = userData.interestedTopics.map((String id) {
      Keyword keyword = keywordsData.firstWhere((Keyword k) => k.id == id);
      return keyword?.name;
    }).toList();
    keywords.sort(); // TODO: kaizen the sort funtion

    print('form >> ' + _formKey.toString());

    return BoxLayout(
      title: 'แก้ไขโปรไฟล์',
      topOverlap: avatarSize / 2,
      bottomOverlap: CONSTANT.FONT_SIZE_HEAD + CONSTANT.SIZE_XS,
      topWidget: ProfileAvatar(
        imgUrl: userData.imgUrl,
        avatarSize: avatarSize,
        fabSize: avatarSize * 0.3,
        fabIcon: Icon(
          Icons.camera_alt,
          size: CONSTANT.SIZE_XL,
        ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Input(
                    hintText: 'ชื่อ',
                    initialValue: userData.firstName,
                  ),
                  Input(
                    hintText: 'นามสกุล',
                    initialValue: userData.lastName,
                  ),
                  Input(
                    hintText: 'อีเมล์',
                    initialValue: userData.email,
                    validator: (String value) =>
                        CONSTANT.REGEX_EMAIL.hasMatch(value)
                            ? null
                            : 'อีเมล์ไม่ถูกต้อง',
                  ),
                  Input(
                    initialValue: '••••••••••',
                    readOnly: true,
                    obscureText: true,
                    suffixText: 'แก้ไข',
                    suffixIcon: IconButtonInk(
                      padding: EdgeInsets.all(0),
                      onPressed: () => print('edit!'),
                      icon: Icon(
                        Icons.edit,
                        color: CONSTANT.COLOR_PRIMARY,
                      ),
                    ),
                  ),
                  SizedBox(height: CONSTANT.SIZE_XX),
                  // TODO: click to open dropdown
                  Dropdown(title: 'คุณคือ', valueLabel: userType, items: []),
                  SizedBox(height: CONSTANT.SIZE_XL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'สิ่งที่คุณสนใจ',
                        style: CONSTANT.TEXT_STYLE_HEADING,
                      ),
                      EditButton(onTap: () => print('edit interested topic'))
                    ],
                  ),
                  Wrap(
                    spacing: CONSTANT.SIZE_XL,
                    runSpacing: 0.0,
                    children: keywords
                        .map((String word) => Chip(
                              padding: EdgeInsets.all(0),
                              label: Text(
                                word,
                                style: TextStyle(
                                    fontSize: CONSTANT.FONT_SIZE_BODY),
                              ),
                              labelPadding: EdgeInsets.all(0),
                              backgroundColor: Colors.white,
                            ))
                        .toList(),
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
