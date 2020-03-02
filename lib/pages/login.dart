import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/login/login_form.dart';
import 'package:endustry/firebase.dart';
import 'package:endustry/storage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);
  
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
              Positioned(
                left: 0.0,
                right: 0.0,
                child: Image(
                  image: AssetImage('assets/images/appbg.png'),
                  colorBlendMode: BlendMode.multiply,
                  color: CONSTANT.COLOR_PRIMARY,
                ),
              ),
              PagePadding(
                side: CONSTANT.SIZE_XL * 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('register'),
                      onPressed: () => _firebaseDB.register(
                        _form['email'],
                        Utils.encode(_form['password']),
                      ),
                    ),
                    RaisedButton(
                      child: Text('login'),
                      onPressed: () => _firebaseDB.login(
                        _form['email'],
                        Utils.encode(_form['password']),
                      ),
                    ),
                    Text(
                      'ยินดีต้อนรับ',
                      style: TextStyle(
                        fontSize: CONSTANT.FONT_SIZE_TITLE,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: CONSTANT.SIZE_XS),
                    LoginForm(),
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
