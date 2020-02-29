import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _form = {};

  Function saveForm(key) => (value) {
        setState(() {
          _form[key] = value;
        });
      };

  Function onLogin(context) => () {
        if (_formKey.currentState.validate()) {
          // TODO: check db
          print('_form >> ' + _form.toString());
          // Navigator.pushNamedAndRemoveUntil(
          //     context, '/home', (Route<dynamic> route) => false);
        }
      };

  @override
  Widget build(BuildContext context) {
    print('_form >> ' + _form.length.toString());
    return Scaffold(
      body: Container(
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
                            hintText: 'อีเมล์',
                            prefixIcon: Icon(Icons.email),
                            onChanged: saveForm('email'),
                            validator: (String value) =>
                                CONSTANT.REGEX_EMAIL.hasMatch(value)
                                    ? null
                                    : 'อีเมล์ไม่ถูกต้อง',
                          ),
                          Input(
                            hintText: 'รหัสผ่าน',
                            prefixIcon: Icon(Icons.lock),
                            onChanged: saveForm('password'),
                          ),
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
                              onPressed: onLogin(context),
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
    );
  }
}
