import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/menu/edit_profile_layout.dart';
import 'package:endustry/widgets/menu/profile_avatar.dart';
import 'package:endustry/widgets/menu/edit_button.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EditProfileForm();
  }
}

class EditProfileForm extends StatefulWidget {
  final User userData = Storage.user;
  final List<Keyword> keywordsData = MOCK_KEYWORDS;
  final List<UserType> userTypesData = MOCK_USERTYPES;

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isValid = true;
  var _form = {};

  @override
  void initState() {
    print('_form000 >> ' + _form.runtimeType.toString());
    _form = {
      "firstName": widget.userData.firstName,
      "lastName": widget.userData.lastName,
      "email": widget.userData.email,
      "typeId": widget.userData.typeId,
      "interestedTopics": widget.userData.interestedTopics,
      "img": widget.userData.img,
    };
    super.initState();
  }

  void validateForm() {
    this.setState(() {
      _isValid = _formKey.currentState.validate();
    });
  }

  void submitForm() {
    print('_form >> ' + _form.toString());
    // TODO: update profile
  }

  Function saveForm(key) => (value) {
        setState(() {
          _form[key] = value;
        });
      };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double avatarSize = width * 0.4;

    String userType = widget.userTypesData
        .firstWhere((UserType t) => t.id == _form['typeId'])
        .name;

    List keywords = _form['interestedTopics'].map((String id) {
      Keyword keyword =
          widget.keywordsData.firstWhere((Keyword k) => k.id == id);
      return keyword?.name;
    }).toList();
    keywords.sort(); // TODO: kaizen the sort funtion

    return EditProfileLayout(
      title: 'แก้ไขโปรไฟล์',
      topOverlap: avatarSize / 2,
      bottomOverlap: CONSTANT.FONT_SIZE_HEAD + CONSTANT.SIZE_XS,
      topWidget: ProfileAvatar(
        img: _form['img'],
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
        disabled: !_isValid,
        onPressed: submitForm,
      ),
      // TODO: submit form
      child: Form(
        key: _formKey,
        autovalidate: true,
        onChanged: validateForm,
        child: Column(
          children: <Widget>[
            PageScrollBody(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Input(
                    hintText: 'ชื่อ',
                    style: TextStyle(fontSize: width * 0.05),
                    initialValue: _form['firstName'],
                    onChanged: saveForm('firstName'),
                  ),
                  Input(
                    hintText: 'นามสกุล',
                    style: TextStyle(fontSize: width * 0.05),
                    initialValue: _form['lastName'],
                    onChanged: saveForm('lastName'),
                  ),
                  Input(
                    hintText: 'อีเมล์',
                    style: TextStyle(fontSize: width * 0.05),
                    initialValue: _form['email'],
                    onChanged: saveForm('email'),
                    validator: (String value) =>
                        CONSTANT.REGEX_EMAIL.hasMatch(value)
                            ? null
                            : 'อีเมล์ไม่ถูกต้อง',
                  ),
                  // TODO: edit password
                  Input(
                    initialValue: '••••••••••',
                    style: TextStyle(fontSize: width * 0.05),
                    readOnly: true,
                    obscureText: true,
                    suffixText: 'เปลี่ยนรหัสผ่าน',
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
                        .map((word) => Chip(
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
