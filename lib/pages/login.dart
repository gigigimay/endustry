import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _form = {};
  bool _loginFailed = false;

  Function saveForm(key) => (value) {
        setState(() {
          _form[key] = value;
        });
      };

  Function onSubmit(context) => () async {
        if (_formKey.currentState.validate()) {
          final storage = Storage();
          var user = await storage.getUserDataFromEmailPassword(
            _form['email'],
            _form['password'],
          );
          if (user != null) {
            storage.login(user);
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (Route<dynamic> route) => false);
          } else {
            setState(() {
              _loginFailed = true;
            });
          }
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          color: CONSTANT.COLOR_PRIMARY,
          child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/appbg.png'),
                colorBlendMode: BlendMode.multiply,
                color: CONSTANT.COLOR_PRIMARY,
              ),
              PagePadding(
                side: CONSTANT.SIZE_XL * 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ยินดีต้อนรับ',
                      style: TextStyle(
                        fontSize: CONSTANT.FONT_SIZE_TITLE,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: CONSTANT.SIZE_XS),
                    RoundedBox(
                      padding: EdgeInsets.all(CONSTANT.SIZE_XL),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Input(
                              autofocus: true,
                              hintText: 'อีเมล',
                              prefixIcon: Icon(Icons.email),
                              keyboardType: TextInputType.emailAddress,
                              // TODO: implement keyboard action
                              textInputAction: TextInputAction.next,
                              onChanged: saveForm('email'),
                              validator: (String value) =>
                                  CONSTANT.REGEX_EMAIL.hasMatch(value)
                                      ? null
                                      : 'อีเมลไม่ถูกต้อง',
                            ),
                            Input(
                              hintText: 'รหัสผ่าน',
                              prefixIcon: Icon(Icons.lock),
                              textInputAction: TextInputAction.done,
                              onChanged: saveForm('password'),
                              obscureText: true,
                            ),
                            _loginFailed
                                ? Text(
                                    'อีเมลล์หรือรหัสผ่านไม่ถูกต้อง',
                                    style: TextStyle(
                                        color: Theme.of(context).errorColor),
                                  )
                                : Container(),
                            FlatButton(
                              onPressed: () => print('forget'),
                              child: Text(
                                'ลืมรหัสผ่าน?',
                                textAlign: TextAlign.end,
                                style: TextStyle(color: CONSTANT.COLOR_PRIMARY),
                              ),
                              padding: EdgeInsets.all(0.0),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: GradientButton(
                                onPressed: onSubmit(context),
                                text: 'เข้าสู่ระบบ',
                              ),
                            ),
                            SizedBox(height: CONSTANT.SIZE_SM),
                            SizedBox(
                              width: double.infinity,
                              child: CustomOutlineButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                text: 'สมัครสมาชิก',
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
