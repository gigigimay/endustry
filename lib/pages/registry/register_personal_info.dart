import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class RegisterPage1 extends StatefulWidget {
  RegisterPage1({Key key, this.isSelected}) : super(key: key);
  final bool isSelected;
  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  final _formKey = GlobalKey<FormState>();
  bool _isValid = true;
  var _form = {};

  void validateForm() {
    this.setState(() {
      _isValid = _formKey.currentState.validate();
    });
  }

  void submitForm() {
    print('_form >> ' + _form.toString());
    // TODO: create profile
  }

  Function saveForm(key) => (value) {
        setState(() {
          _form[key] = value;
        });
      };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: false,
      onChanged: validateForm,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
        padding: EdgeInsets.symmetric(
            horizontal: CONSTANT.SIZE_XL, vertical: CONSTANT.SIZE_LG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Input(
              hintText: 'ชื่อ',
              style: TextStyle(
                  fontSize: CONSTANT.FONT_SIZE_BODY,
                  fontWeight: FontWeight.w300),
              onChanged: saveForm('firstName'),
            ),
            Input(
              hintText: 'นามสกุล',
              style: TextStyle(
                  fontSize: CONSTANT.FONT_SIZE_BODY,
                  fontWeight: FontWeight.w300),
              onChanged: saveForm('lastName'),
            ),
            Input(
              hintText: 'อีเมล์',
              style: TextStyle(
                  fontSize: CONSTANT.FONT_SIZE_BODY,
                  fontWeight: FontWeight.w300),
              onChanged: saveForm('email'),
              validator: (String value) => CONSTANT.REGEX_EMAIL.hasMatch(value)
                  ? null
                  : 'อีเมล์ไม่ถูกต้อง',
            ),
            Input(
              hintText: 'รหัสผ่าน',
              style: TextStyle(
                  fontSize: CONSTANT.FONT_SIZE_BODY,
                  fontWeight: FontWeight.w300),
              obscureText: true,
            ),
            Input(
              hintText: 'ยืนยันรหัสผ่าน',
              style: TextStyle(
                  fontSize: CONSTANT.FONT_SIZE_BODY,
                  fontWeight: FontWeight.w300),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
