import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/edit_profile/edit_profile.dart';
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
  var _form = {};

  TextEditingController _oldPwdCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void clearField(String key, TextEditingController controller) {
    controller.clear();
    setState(() {
      _form.remove(key);
    });
  }

  void submitForm() async {
    if (_formKey.currentState.validate()) {
      await Storage()
          .editUserPassword(widget.userData.id, _form['newPassword']);
      Navigator.pop(context, true);
    } else if (_form.length == 3 &&
        _form['newPassword'] == _form['confirmNewPassword'] &&
        _form['oldPassword'] != Storage.user.password) {
      print('password >> ' + widget.userData.password);
      clearField('oldPassword', _oldPwdCtrl);
    }
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
        onPressed: submitForm,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            PageScrollBody(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Input(
                    controller: _oldPwdCtrl,
                    obscureText: true,
                    hintText: 'รหัสผ่านปัจจุบัน',
                    style: TextStyle(fontSize: width * 0.05),
                    onChanged: saveForm('oldPassword'),
                    // TODO: implement keyboard action
                    textInputAction: TextInputAction.next,
                    validator: (String v) => (_form.length == 3 &&
                            _form['newPassword'] == _form['confirmNewPassword'])
                        ? v != Storage.user.password
                            ? 'รหัสผ่านปัจจุบันไม่ถูกต้อง'
                            : null
                        : null,
                  ),
                  Input(
                    obscureText: true,
                    hintText: 'รหัสผ่านใหม่',
                    style: TextStyle(fontSize: width * 0.05),
                    onChanged: saveForm('newPassword'),
                    // TODO: implement keyboard action
                    textInputAction: TextInputAction.next,
                  ),
                  Input(
                    obscureText: true,
                    hintText: 'ยืนยันรหัสผ่านใหม่',
                    style: TextStyle(fontSize: width * 0.05),
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
