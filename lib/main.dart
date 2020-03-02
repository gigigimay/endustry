import 'package:endustry/export.dart';
import 'package:endustry/theme.dart';
import 'package:endustry/pages/login.dart';
import 'package:endustry/pages/registry/register_page.dart';
import 'package:endustry/pages/registry/register_personal_info.dart';
import 'package:endustry/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endustry',
      theme: themeData,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(),
      },
      home: SplashPage(),
    );
  }
}
