import 'package:endustry/export.dart';
import '../constants.dart' as CONSTANT;
import '../widgets/home/searchbar.dart';
import '../widgets/home/list_group.dart';

const MOCK_ITEMS = [
  {'label': 'ระบบรับแจ้งข้อเท็จจริงของผู้นำเข้าหรือส่งออก ซึ่งวัตถุอันตราย'},
  {'label': 'นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ'},
  {'label': 'นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ'},
  {'label': 'นะโม ตัสสะ ภะคะวะโต อะระหะโต สัมมาสัมพุท ธัสสะ'},
  {'label': 'มะริ่งกิ่งก่อง สะระน๊องก่องแก่ง'},
  {'label': 'มะน่องมะแน่งมั๊บ ปะล่องป่องแป่ง'},
  {'label': 'ง้องแง้งง้องแง้ง ในชีวิตเธอ'},
];

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BgLayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PagePadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TitleText('กระทรวง'),
                        TitleText('อุตสาหกรรม', fontSize: 50.0, height: 0.8),
                      ],
                    ),
                    const SizedBox(height: CONSTANT.SIZE_XX),
                    SearchBar(),
                  ],
                ),
              ),
              const SizedBox(height: CONSTANT.SIZE_XL),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      ListGroup(title: 'การใช้งานล่าสุด', items: MOCK_ITEMS),
                      ListGroup(title: 'บริการแนะนำ', items: MOCK_ITEMS),
                      ListGroup(title: 'คลังความรู้แนะนำ', items: MOCK_ITEMS),
                    ],
                  ),
                ),
              ),
              Navigationbar(
                currentpage: 'home',
              )
            ],
          ),
        ),
      ),
    );
  }
}
