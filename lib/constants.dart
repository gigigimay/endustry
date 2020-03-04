import 'package:flutter/material.dart';

const String PIC = 'assets/images/pic.png';

const Image PLACEHOLDER_IMAGE = Image(image: AssetImage(PIC));

// -------------------- colors --------------------
const Color COLOR_PRIMARY = Color(0xff7F4192);
const Color COLOR_SECONDARY = Color(0xff4337A7);
const Color COLOR_BACKGROUND = Color(0xfff3f3f3);
const Color COLOR_DISABLED = Color(0xffbebebe);
const Color COLOR_BODY = Color(0xff414141);
const Color COLOR_BORDER = Color(0xffbebebe);
const Color COLOR_BORDER_LIGHT = Color(0xffe0e0e0);

// -------------------- spacing size --------------------
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

// -------------------- border --------------------
/// 1
const double BORDER_WIDTH_NORMAL = 1.0;

/// 3
const double BORDER_WIDTH_MEDIUM = 3.0;

/// 5
const double BORDER_WIDTH_THICK = 5.0;

/// 10
const double BORDER_RADIUS = 10.0;

// -------------------- font size --------------------
/// 16
const double FONT_SIZE_BODY = 16.0;

/// 24
const double FONT_SIZE_HEAD = 24.0;

/// 36
const double FONT_SIZE_TITLE = 36.0;

// -------------------- font style --------------------
const TextStyle TEXT_STYLE_BODY =
    TextStyle(fontSize: FONT_SIZE_BODY, color: COLOR_BODY);
const TextStyle TEXT_STYLE_BODY_PRIMARY = TextStyle(
    color: COLOR_PRIMARY,
    fontSize: FONT_SIZE_BODY,
    fontWeight: FontWeight.w700);
const TextStyle TEXT_STYLE_HEADING = TextStyle(
    fontSize: FONT_SIZE_HEAD, color: COLOR_BODY, fontWeight: FontWeight.w700);
const TextStyle TEXT_STYLE_HEADING_PRIMARY = TextStyle(
    fontSize: FONT_SIZE_HEAD,
    color: COLOR_PRIMARY,
    fontWeight: FontWeight.w700);
const TextStyle TEXT_STYLE_TITLE = TextStyle(
    fontSize: FONT_SIZE_TITLE,
    fontWeight: FontWeight.w700,
    color: COLOR_PRIMARY);

// -------------------- boxShadow --------------------
const BoxShadow BOX_SHADOW = BoxShadow(
  color: Color(0x26000000),
  offset: Offset(0, 3),
  blurRadius: 6,
);

// -------------------- regex --------------------
class REGEX {
  static RegExp email = RegExp(
    r'[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+$',
    caseSensitive: false,
    multiLine: false,
  );
  static RegExp password = RegExp(r'^([A-Za-z\d]{4,})$');
  static String validatePassword(String value) {
    print('"$value" >> ${password.hasMatch(value)}');
    return password.hasMatch(value)
        ? null
        : 'รหัสผ่านต้องเป็นตัวอักษรภาษาอังกฤษหรือตัวเลข และมีความยาวตั้งแต่ 4 ตัวอักษรขึ้นไป';
  }

  static String validateEmail(String value) =>
      email.hasMatch(value) ? null : 'อีเมลไม่ถูกต้อง';
}

// -------------------- word --------------------
const WORD_SERVICE_TH = 'บริการ';
const WORD_SERVICE_ENG = 'service';
const WORD_SERVICE_ALL_TH = 'บริการทั้งหมด';
const WORD_SERVICE_ALL_ENG = 'all services';
const WORD_NEWS_TH = 'ข่าว';
const WORD_NEWS_ENG = 'news';
const WORD_KNOWLEDGE_TH = 'คลังความรู้';
const WORD_KNOWLEDGE_ENG = 'knowledge';
const WORD_ALL_TH = 'ทั้งหมด';
const WORD_ALL_ENG = 'all';
const WORD_SEARCH_TH = 'ค้นหา';
const WORD_SEARCH_ENG = 'search';
const WORD_DEPARTMENT_TH = 'หน่วยงาน';
const WORD_DEPARTMENT_ENG = 'department';
