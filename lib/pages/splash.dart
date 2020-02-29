import 'package:endustry/export.dart';
import 'package:endustry/storage.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  setUp() async {
    final storage = Storage();
    await storage.initDB();
    final String pageName = await storage.checkUidPrefs() ? '/home' : '/login';
    // TODO: add some delay time before pushing to make it feels smoother
    Navigator.pushNamed(context, pageName);
  }

  @override
  void initState() {
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          width: width * 0.5,
          child: Image(image: AssetImage('assets/images/LOGO.png')),
        ),
      ),
    );
  }
}
