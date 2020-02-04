import 'package:endustry/export.dart';
import 'constants.dart' as CONSTANT;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endustry',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: CONSTANT.COLOR_PRIMARY,
          backgroundColor: CONSTANT.COLOR_BACKGROUND,
          dividerColor: CONSTANT.COLOR_DISABLED,
          disabledColor: CONSTANT.COLOR_DISABLED,
          fontFamily: 'CloudSoft',
          textTheme: TextTheme(
            body1: TextStyle(
                fontSize: CONSTANT.FONT_SIZE_BODY, color: CONSTANT.COLOR_BODY),
            title: TextStyle(
                fontSize: CONSTANT.FONT_SIZE_TITLE,
                fontWeight: FontWeight.w700,
                color: CONSTANT.COLOR_PRIMARY),
            button: TextStyle(
                fontSize: CONSTANT.FONT_SIZE_BODY, fontWeight: FontWeight.w700),
            subhead: TextStyle(
                fontSize: CONSTANT.FONT_SIZE_HEAD,
                fontWeight: FontWeight.w700,
                color: CONSTANT.COLOR_BODY),
          )),
      home: HomePage(),
    );
  }
}
