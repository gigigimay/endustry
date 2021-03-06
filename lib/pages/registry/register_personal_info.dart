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

  Function saveForm(key) => (value) => setState(() {
        _form[key] = value;
      });

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
            password: _form['password'],
          );
        }
      },
      child: RoundedBox(
        padding: EdgeInsets.symmetric(
            horizontal: CONSTANT.SIZE_XL, vertical: CONSTANT.SIZE_LG),
        child: Form(
          key: _registFormKey,
          autovalidate: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Input(
                initialValue: widget.initData['firstName'],
                hintText: 'ชื่อ',
                onChanged: saveForm('firstName'),
              ),
              Input(
                initialValue: widget.initData['lastName'],
                hintText: 'นามสกุล',
                onChanged: saveForm('lastName'),
              ),
              Input(
                initialValue: widget.initData['email'],
                hintText: 'อีเมล',
                onChanged: saveForm('email'),
                validator: CONSTANT.REGEX.validateEmail,
              ),
              Input(
                initialValue: widget.initData['password'],
                hintText: 'รหัสผ่าน',
                obscureText: true,
                onChanged: saveForm('password'),
                validator: CONSTANT.REGEX.validatePassword,
              ),
              Input(
                initialValue: widget.initData['password'],
                hintText: 'ยืนยันรหัสผ่าน',
                obscureText: true,
                validator: (String value) =>
                    value == _form['password'] ? null : 'รหัสผ่านไม่ตรงกัน',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
