import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class MenuAboutPage extends StatelessWidget {
  const MenuAboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BgLayout(
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'เกี่ยวกับกระทรวง',
            hasBackArrow: true,
            backArrowFunction: () {
              Navigator.pop(context);
            },
          ),
          PagePadding(
            child: RoundedBox(
              padding: EdgeInsets.symmetric(
                horizontal: CONSTANT.SIZE_XL,
                vertical: CONSTANT.SIZE_XX,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: width * 0.4,
                      child: Image(image: AssetImage('assets/images/LOGO.png')),
                      padding: EdgeInsets.only(bottom: CONSTANT.SIZE_XX),
                    ),
                  ),
                  Text(
                    'ข้อมูลเกี่ยวกับกระทรวงอุตสาหกรรม',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                      'กระทรวงอุตสาหกรรม (อังกฤษ: Ministry of Industry) เป็นส่วนราชการของรัฐบาลไทยประเภทกระทรวง มีอำนาจหน้าที่เกี่ยวกับการส่งเสริมและพัฒนาอุตสาหกรรม การพัฒนาผู้ประกอบการ และราชการอื่นตามที่มีกฎหมายกำหนดให้เป็นอำนาจหน้าที่ของกระทรวงอุตสาหกรรม หรือส่วนราชการที่สังกัดกระทรวงอุตสาหกรรม'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
