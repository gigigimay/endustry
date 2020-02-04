import 'package:flutter/material.dart';

// colors
const Color COLOR_PRIMARY = Color(0xff7F4192);
const Color COLOR_BACKGROUND = Color(0xfff3f3f3);
const Color COLOR_DISABLED = Color(0xffbebebe);
const Color COLOR_BODY = Color(0xff414141);

// spacing size
/// 4
const double SIZE_XS = 4.0; 
/// 8
const double SIZE_SM = 8.0;
/// 12
const double SIZE_MD = 12.0;
/// 16
const double SIZE_LG = 16.0;
/// 24
const double SIZE_XL = 24.0;
/// 32
const double SIZE_XX = 32.0;

// border radius
const double BORDER_RADIUS = 10.0;

// font size
/// 16
const double FONT_SIZE_BODY = 16.0;
/// 24
const double FONT_SIZE_HEAD = 24.0;
/// 36
const double FONT_SIZE_TITLE = 36.0;

// font style
const TextStyle TEXT_STYLE_BODY_PRIMARY = TextStyle(
    color: COLOR_PRIMARY);
const TextStyle TEXT_STYLE_HEADING = TextStyle(
    fontSize: FONT_SIZE_HEAD, color: COLOR_BODY, fontWeight: FontWeight.w700);
const TextStyle TEXT_STYLE_HEADING_PRIMARY = TextStyle(
    fontSize: FONT_SIZE_HEAD, color: COLOR_PRIMARY, fontWeight: FontWeight.w700);

// boxShadow
const BoxShadow BOX_SHADOW = BoxShadow(
  color: Color(0x26000000),
  offset: Offset(0, 3),
  blurRadius: 6,
);
