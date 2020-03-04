import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/firebase.dart';
import 'package:endustry/storage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key, this.initMail}) : super(key: key);
  final initMail;
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  bool _loginFailed = false;

  Function onSubmit(context) => () async {
        if (_formKey.currentState.validate()) {
          final storage = Storage();
          final firebaseDB = FirebaseDB();
          User user = await firebaseDB.login(
            _mailController.text,
            Utils.encode(_passController.text),
          );
          if (user != null) {
            await storage.login(user);
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
  void initState() {
    super.initState();
    _mailController.text = widget.initMail;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      padding: EdgeInsets.all(CONSTANT.SIZE_XL),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Input(
              controller: _mailController,
              autofocus: true,
              hintText: 'อีเมล',
              prefixIcon: Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
              // TODO: implement keyboard action
              textInputAction: TextInputAction.next,
              validator: (String value) => CONSTANT.REGEX.email.hasMatch(value)
                  ? null
                  : 'อีเมลไม่ถูกต้อง',
            ),
            Input(
              controller: _passController,
              hintText: 'รหัสผ่าน',
              prefixIcon: Icon(Icons.lock),
              textInputAction: TextInputAction.done,
              obscureText: true,
            ),
            _loginFailed
                ? Text(
                    'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  )
                : Container(),
            FlatButton(
              onPressed: () => print('forget'),
              padding: EdgeInsets.all(0.0),
              child: Text(
                'ลืมรหัสผ่าน?',
                textAlign: TextAlign.end,
                style: TextStyle(color: CONSTANT.COLOR_PRIMARY),
              ),
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
    );
  }
}
