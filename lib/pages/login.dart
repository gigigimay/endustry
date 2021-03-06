import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/login/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.initMail}) : super(key: key);
  final initMail;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: CustomLoadingOverlay(
        isLoading: _isLoading,
        child: UnfocusNode(
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
                      Text(
                        'ยินดีต้อนรับ',
                        style: TextStyle(
                          fontSize: CONSTANT.FONT_SIZE_TITLE,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: CONSTANT.SIZE_XS),
                      LoginForm(
                        initMail: widget.initMail,
                        setLoading: setLoading,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
