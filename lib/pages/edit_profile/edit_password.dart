import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/menu/edit_profile_layout.dart';

class EditPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EditPasswordForm();
  }
}

class EditPasswordForm extends StatefulWidget {
  final User userData = Storage.user;
  final List<Keyword> keywordsData = MOCK_KEYWORDS;
  final List<UserType> userTypesData = MOCK_USERTYPES;

  @override
  _EditPasswordFormState createState() => _EditPasswordFormState();
}

class _EditPasswordFormState extends State<EditPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isValid = true;
  var _form = {};
  var _touched = {};

  @override
  void initState() {
    _touched['oldPassword'] = false;
    _touched['newPassword'] = false;
    _touched['confirmNewPassword'] = false;
    super.initState();
  }

  void validateForm() {
    this.setState(() {
      _isValid = _formKey.currentState.validate();
    });
  }

  void submitForm() async {}

  Function saveForm(key) => (value) {
        setState(() {
          _form[key] = value;
          _touched[key] = true;
        });
      };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double avatarSize = width * 0.4;

    return EditProfileLayout(
      title: 'เปลี่ยนรหัสผ่าน',
      topOverlap: avatarSize / 2,
      bottomOverlap: CONSTANT.FONT_SIZE_HEAD + CONSTANT.SIZE_XS,
      topWidget: Icon(
        Icons.lock,
        size: avatarSize,
      ),
      bottomWidget: GradientButton(
        text: 'ยืนยัน',
        disabled: _form.length < 3 || !_isValid,
        onPressed: submitForm,
      ),
      child: Form(
        key: _formKey,
        onChanged: validateForm,
        child: Column(
          children: <Widget>[
            PageScrollBody(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Input(
                    obscureText: true,
                    hintText: 'รหัสผ่านปัจจุบัน',
                    style: TextStyle(fontSize: width * 0.05),
                    touched: _touched['oldPassword'],
                    onChanged: saveForm('oldPassword'),
                    // TODO: implement keyboard action
                    textInputAction: TextInputAction.next,
                  ),
                  Input(
                    obscureText: true,
                    hintText: 'รหัสผ่านใหม่',
                    style: TextStyle(fontSize: width * 0.05),
                    touched: _touched['newPassword'],
                    onChanged: saveForm('newPassword'),
                    // TODO: implement keyboard action
                    textInputAction: TextInputAction.next,
                  ),
                  Input(
                    obscureText: true,
                    hintText: 'ยืนยันรหัสผ่านใหม่',
                    style: TextStyle(fontSize: width * 0.05),
                    touched: _touched['confirmNewPassword'],
                    onChanged: saveForm('confirmNewPassword'),
                    textInputAction: TextInputAction.done,
                    validator: (String v) => v != _form['newPassword']
                        ? 'กรุณากรอกรหัสผ่านให้ตรงกัน'
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
