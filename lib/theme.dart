import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

final themeData = ThemeData(
  primarySwatch: Colors.purple,
  primaryColor: CONSTANT.COLOR_PRIMARY,
  backgroundColor: CONSTANT.COLOR_BACKGROUND,
  dividerColor: CONSTANT.COLOR_DISABLED,
  disabledColor: CONSTANT.COLOR_DISABLED,
  highlightColor: Colors.transparent,
  splashColor: Colors.purple[100],
  fontFamily: 'CloudSoft',
  textTheme: TextTheme(
    body1: CONSTANT.TEXT_STYLE_BODY,
    title: CONSTANT.TEXT_STYLE_TITLE,
    button: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
    subhead: CONSTANT.TEXT_STYLE_HEADING,
  ),
  iconTheme: IconThemeData(
    color: CONSTANT.COLOR_PRIMARY,
    size: CONSTANT.SIZE_XX,
  ),
);
