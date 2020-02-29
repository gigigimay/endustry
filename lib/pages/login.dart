import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  Function onLogin(context) => () {
        // TODO: check db
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', (Route<dynamic> route) => false);
      };

  @override
  Widget build(BuildContext context) {
    return BgLayout(
      bgColor: CONSTANT.COLOR_PRIMARY,
      child: PagePadding(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Input(
                    autofocus: true,
                    hintText: 'อีเมล์',
                    prefixIcon: Icon(Icons.email),
                  ),
                  Input(
                    hintText: 'รหัสผ่าน',
                    prefixIcon: Icon(Icons.lock),
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
            )
          ],
        ),
      ),
    );
  }
}
