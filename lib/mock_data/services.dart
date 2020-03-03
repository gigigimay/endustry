import '../models.dart';

const List<Service> MOCK_SERVICES = [
  Service(
    id: 'sv01',
    name: 'ระบบจัดการวัสดุที่ไม่ใช้แล้ว',
    description:
        'ระบบการจัดการกากของเสียอุตสาหกรรมผ่านทางสื่ออิเล็กทรอนิกส์ สำหรับผู้ก่อให้เกิดสิ่งปฏิกูลหรือวัสดุที่ไม่ใช้แล้ว',
    url: 'http://iwmb5.diw.go.th/e-license/login.asp',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw01', 'kw34'],
  ),
  Service(
    id: 'sv02',
    name: 'ระบบฐานข้อมูลสารกัมมันตรังสี',
    description:
        'การรายงานข้อมูลสารกัมมันตรังสีที่โรงงานมีการครอบครอง และสารกัมมันตรังสีในรอบปีที่ต้องรายงานตามแบบ รง. 7 ผ่านสื่ออิเล็กทรอนิกส์',
    url: 'http://reg.diw.go.th/DiwRad/util/login.asp',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw02', 'kw34'],
  ),
  Service(
    id: 'sv03',
    name: 'ระบบขึ้นทะเบียนบุคลากรสิ่งแวดล้อม',
    description:
        'แบบคำขอขึ้นทะเบียนด้านสิ่งแวดล้อมประจำโรงงานผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'https://www.diw.go.th/hawk/default.php',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw03', 'kw04', 'kw34'],
  ),
  Service(
    id: 'sv04',
    name: 'ระบบรายงานปริมาณสารมลพิษ',
    description:
        'ระบบการรายงานชนิดและปริมาณสารมลพิษที่ระบายออกจากโรงงานผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'https://www.diw.go.th/hawk/default.php',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw06', 'kw33', 'kw34'],
  ),
  Service(
    id: 'sv05',
    name: 'ระบบรับแจ้งข้อเท็จจริงของผู้นำเข้าหรือส่งออก ซึ่งวัตถุอันตราย',
    description:
        'ระบบหารือเคมีภัณฑ์และรับแจ้งข้อเท็จจริงเกี่ยวกับการผลิตหรือนำเข้าหรือส่งออก ซึ่งวัตถุอันตรายตามบัญชี 5.6 ผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://haz2.diw.go.th/LinkVK6/index.html',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw05', 'kw34'],
  ),
  Service(
    id: 'sv06',
    name: 'ระบบตรวจสอบมลพิษระยะไกล',
    description:
        'ระบบตรวจสอบและแจ้งข้อมูลมลพิษระยะไกลผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'https://www.diw.go.th/hawk/default.php',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep06',
    tag: ['kw06', 'kw34'],
  ),
  Service(
    id: 'sv07',
    name: 'การสอบบุคลากรเฉพาะ',
    description:
        'ระบบรับสมัครเข้าทดสอบวัดความรู้ หลักสูตรความปลอดภัยการเก็บรักษาวัตถุอันตราย ที่กรมโรงงานอุตสาหกรรมกำหนด',
    url: 'http://hazexam.diw.go.th/index.asp',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw04', 'kw05', 'kw34'],
  ),
  Service(
    id: 'sv08',
    name: 'ระบบขนส่งวัตถุอันตราย',
    description:
        'แบบฟอรมเอกสารประกอบการขนส่งวัตถุอันตรายแบบหลายระบบ ผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://doa.diw.go.th/HazLogist/index.zul',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw05', 'kw34'],
  ),
  Service(
    id: 'sv09',
    name: 'ติดตามการดำเนินการอนุญาตโรงงาน',
    description:
        'การดำเนินการอนุญาตโรงงาน และการดำเนินการจดทะเบียนเครื่องจักร ผ่านสื่ออิเล็กทรอนิกส์',
    url: 'http://reg.diw.go.th/executive/tracking4.asp',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw07', 'kw34'],
  ),
  Service(
    id: 'sv10',
    name: 'ติดตามการดำเนินการอนุญาตเกี่ยวกับวัตถุอันตราย',
    description:
        'ระบบการติดตาม และการดำเนินการอนุญาตเกี่ยวกับวัตถุอันตราย ผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://eis.diw.go.th/haz/hazdiw/searc_recv.asp',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw05', 'kw34'],
  ),
  Service(
    id: 'sv11',
    name: 'ทำเนียบการปลดปล่อยและเคลื่อนย้ายมลพิษ (PRTR)',
    description:
        'ระบบฐานข้อมูลที่เผยแพร่สู่สาธารณชนเกี่ยวกับชนิดและปริมาณของมลพิษเป้าหมายที่มีการปลดปล่อยจากแหล่งกำเนิดเป้าหมายประเภทต่างๆ สู่ตัวกลางสิ่งแวดล้อมทั้งอากาศ ดิน น้ำ รวมถึงข้อมูลการนำน้ำเสียและของเสียออกจากแหล่งกำเนิดไปบำบัดหรือกำจัด ผ่านสื่ออิเล็กทรอนิกส์',
    url: 'http://iwmb5.diw.go.th/e-license/login.asp',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw03', 'kw06', 'kw34'],
  ),
  Service(
    id: 'sv12',
    name:
        'ระบบรับแจ้งข้อเท็จจริงของผู้ผลิต ผู้นำเข้า ผู้ส่งออก หรือผู้มีไว้ในครอบครอง',
    description:
        'ผู้ผลิต ผู้นําเข้า ผู้ส่งออก หรือผู้มีไว้ในครอบครอง ซึ่งวัตถุอันตรายตามบัญชีรายชื่อวัตถุอันตราย แจ้งข้อเท็จจริงเกี่ยวกับ ชื่อ สูตรและอัตราส่วน ชื่อทางการค้า ชื่อสามัญหรือชื่อย่อ(ถ้ามี) ทะเบียน(ถ้ามี) ปริมาณที่ผลิต นําเข้า ส่งออก หรือมีไว้ในครอบครอง ปริมาณที่ขาย ขายแก่ผู้ใด และผู้ซื้อนำไปใช้ในกิจการใด ผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://haz2.diw.go.th/vk7/',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw05', 'kw08', 'kw33', 'kw34'],
  ),
  Service(
    id: 'sv13',
    name:
        'ระบบหารือเคมีภัณฑ์และรับแจ้งข้อเท็จจริงเกี่ยวกับการผลิตหรือนำเข้า ซึ่งวัตถุอันตรายตามบัญชี 5.6',
    description:
        'ระบบรับแจ้งข้อเท็จจริงเกี่ยวกับการนำเข้า ส่งออก และครอบครองเคมีภัณฑ์ที่เป็นอันตรายตามบัญชี ผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://haz3.diw.go.th/hazvk/',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw05', 'kw34'],
  ),
  Service(
    id: 'sv14',
    name: 'ระบบการขึ้นทะเบียนบุคลากรด้านก๊าซอุตสาหกรรม',
    description:
        'ระบบการขึ้นทะเบียนบุคลากรด้านก๊าซอุตสาหกรรม ผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://reg.diw.go.th/gas2/admin/util/login.asp',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep01',
    tag: ['kw04', 'kw09', 'kw34'],
  ),
  Service(
    id: 'sv15',
    name: 'ชำระค่าผลประโยชน์ตอบแทนพิเศษ',
    description:
        'ตรวจสอบการชำระค่าผลประโยชน์ตอบแทนพิเศษแก่รัฐ ผ่านอิเล็กทรอนิกส์',
    url: 'http://www1.dpim.go.th/mnp/mnpay.php',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep02',
    tag: ['kw10', 'kw34'],
  ),
  Service(
    id: 'sv16',
    name: 'ชำระค่าใช้เนื้อที่ประทานบัตร',
    description:
        'ตรวจสอบการชำระค่าธรรมเนียมการใช้เนื้อที่ประทานบัตร ผ่านอิเล็กทรอนิกส์',
    url: 'http://www1.dpim.go.th/mnp/mnpay.php',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep02',
    tag: ['kw10', 'kw11', 'kw34'],
  ),
  Service(
    id: 'sv17',
    name: 'ยื่นแบบรายงานการทำเหมือง (รายการงาน ทธ.40)',
    description: 'ยื่นแบบรายงานการทำเหมืองผ่านอิเล็กทรอนิกส์ (รายการงาน ทธ.40)',
    url:
        'http://sso.dpim.go.th/josso/signon/login.do?josso_back_to=http://dses.dpim.go.th/cms/josso_security_check/',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep02',
    tag: ['kw12', 'kw34'],
  ),
  Service(
    id: 'sv18',
    name: 'ตรวจสอบใบอนุญาตขนแร่',
    description: 'การตรวจสอบใบอนุญาตขนแร่ผ่านอิเล็กทรอนิกส์',
    url: 'http://misdev.dpim.go.th/ssopublic-blank/transminerals/index.html',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep02',
    tag: ['kw13', 'kw34'],
  ),
  Service(
    id: 'sv19',
    name: 'ระบบฐานข้อมูลประทานบัตร',
    description:
        'ระบบฐานข้อมูลใบอนุญาตประทานบัตร จากกรมอุตสาหกรรมพื้นฐานและการเหมืองแร่ ผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://www.dpim.go.th/webservices/con_report.php',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep02',
    tag: ['kw11', 'kw34'],
  ),
  Service(
    id: 'sv20',
    name: 'ระบบฐานข้อมูลโรงโม่บดและย่อยหิน',
    description:
        'ระบบแสดงข้อมูลใบอนุญาตโรงโม่บดและย่อยหินผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://www.dpim.go.th/webservices/facstone_report.php',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep02',
    tag: ['kw14', 'kw33', 'kw34'],
  ),
  Service(
    id: 'sv21',
    name: 'ระบบฐานข้อมูลโรงงานเกลือสินเธาว์',
    description:
        'ระบบแสดงข้อมูลใบอนุญาตโรงงานเกลือสินเธาว์ผ่านทางสื่ออิเล็กทรอนิกส์',
    url: 'http://www.dpim.go.th/webservices/facsult_report.php',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep02',
    tag: ['kw07', 'kw15', 'kw33', 'kw34'],
  ),
  Service(
    id: 'sv22',
    name: 'ระบบฐานข้อมูลแหล่งหินอุตสาหกรรม',
    description:
        'ระบบแสดงข้อมูลแหล่งหินเพื่ออุตสาหกรรมก่อสร้าง และแสดงปริมาณสำรองหินอุตสาหกรรมทั่วประเทศ จำนวน 327 แหล่งผ่านทางสื่ออิเล็กทรอนิกส์',
    url:
        'http://mis.dpim.go.th/sourcestone-service_public/sourcestone_data/index.html',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep02',
    tag: ['kw14', 'kw33', 'kw34'],
  ),
  Service(
    id: 'sv23',
    name: 'ขอใช้บริการสารสนเทศสำนักงานคณะกรรมการอ้อยและน้ำตาล',
    description:
        'แบบฟอร์มขอใช้บริการ Internet และ Wifi HOTSPOT สำนักงานคณะกรรมการอ้อยและน้ำตาลทราย ผ่านทางอิเล็กทรอนิกส์',
    url: 'http://ias.ocsb.go.th/egis/e_gis.startup',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep06',
    tag: ['kw16', 'kw17', 'kw33', 'kw34'],
  ),
  Service(
    id: 'sv24',
    name: 'ระบบภูมิสารสนเทศอุตสาหกรรมอ้อย และน้ำตาลทราย',
    description:
        'ใบแจ้งขอรับการบริการของ USER ของงานระบบภูมิสารสนเทศฯ FM-IT-02-04/02 ผ่านทางอิเล็กทรอนิกส์',
    url: 'http://gis10mis.ocsb.go.th/OCSBWeb/user_chk.jsp', //404 not found
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep06',
    tag: ['kw16', 'kw17', 'kw33', 'kw34'],
  ),
  Service(
    id: 'sv25',
    name: 'ระบบสืบค้นข้อมูลการขนย้ายน้ำตาลทราย',
    description:
        'ระบบสืบค้นข้อมูลช่องทางการขนย้ายน้ำตาลในประเทศ และส่งออกต่างประเทศ ผ่านทางอิเล็กทรอนิกส์',
    url: 'http://ias.ocsb.go.th/ccs/sugarzone.startup',
    image: 'assets/images/service/ชื่อไฟล์.png',
    depId: 'dep06',
    tag: ['kw17', 'kw34'],
  ),
];
