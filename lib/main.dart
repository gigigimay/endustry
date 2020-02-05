import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

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
          highlightColor: Colors.purple[50],
          splashColor: Colors.purple[100],
          fontFamily: 'CloudSoft',
          textTheme: TextTheme(
            body1: CONSTANT.TEXT_STYLE_BODY,
            title: CONSTANT.TEXT_STYLE_TITLE,
            button: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
            subhead: CONSTANT.TEXT_STYLE_HEADING,
          )),
      home: HomePage(),
    );
  }
}
