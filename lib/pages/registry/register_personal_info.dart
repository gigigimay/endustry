import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/registry/register_layout.dart';

class RegisterPage1 extends StatefulWidget {
  RegisterPage1(
      {Key key, this.initData, this.nextBtnFuntion, this.prevBtnFuntion})
      : super(key: key);

  final Function prevBtnFuntion, nextBtnFuntion;
  final initData;

  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  final _registFormKey = GlobalKey<FormState>();

  var _form = {};

  bool _isValid = false;
  void validateForm() {
    this.setState(() {
      _isValid = _registFormKey.currentState.validate();
    });
  }

  Function saveForm(key) => (value) {
        setState(() {
          _form[key] = value;
        });
      };

  @override
  void initState() {
    super.initState();

    _form = widget.initData;
  }

  @override
  Widget build(BuildContext context) {
    return RegisterLayout(
      registerStep: 0,
      stateTitle: 'ข้อมูลส่วนตัว',
      prevBtnFuntion: widget.prevBtnFuntion,
      nextBtnFuntion: () {
        validateForm();
        if (_isValid) {
          widget.nextBtnFuntion(
              firstname: _form['firstName'],
              lastname: _form['lastName'],
              email: _form['email'],
              password: _form['password']);
        }
      },
      // disabled: !_isValid,
      child: Form(
        key: _registFormKey,
        autovalidate: false,
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
                initialValue: widget.initData['firstName'],
                hintText: 'ชื่อ',
                style: TextStyle(
                    fontSize: CONSTANT.FONT_SIZE_BODY,
                    fontWeight: FontWeight.w300),
                onChanged: saveForm('firstName'),
              ),
              Input(
                initialValue: widget.initData['lastName'],
                hintText: 'นามสกุล',
                style: TextStyle(
                    fontSize: CONSTANT.FONT_SIZE_BODY,
                    fontWeight: FontWeight.w300),
                onChanged: saveForm('lastName'),
              ),
              Input(
                hintText: 'อีเมล',
                style: TextStyle(
                    fontSize: CONSTANT.FONT_SIZE_BODY,
                    fontWeight: FontWeight.w300),
                onChanged: saveForm('email'),
                validator: (String value) =>
                    CONSTANT.REGEX_EMAIL.hasMatch(value)
                        ? null
                        : 'อีเมลไม่ถูกต้อง',
              ),
              Input(
                hintText: 'รหัสผ่าน',
                style: TextStyle(
                    fontSize: CONSTANT.FONT_SIZE_BODY,
                    fontWeight: FontWeight.w300),
                obscureText: true,
                onChanged: saveForm('password'),
              ),
              Input(
                  hintText: 'ยืนยันรหัสผ่าน',
                  style: TextStyle(
                      fontSize: CONSTANT.FONT_SIZE_BODY,
                      fontWeight: FontWeight.w300),
                  obscureText: true,
                  validator: (String value) =>
                      value == _form['password'] ? null : 'รหัสผ่านไม่ตรงกัน'),
            ],
          ),
        ),
      ),
    );
  }
}
