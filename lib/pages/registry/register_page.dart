import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/registry/register_layout.dart';
import 'package:endustry/pages/registry/register_personal_image.dart';
import 'package:endustry/pages/registry/register_personal_info.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _registState;
  var _registStateText;

  final _milliDuration = 300;
  final _curve = Curves.easeIn;

  PageController _pageController = PageController(initialPage: 0);

  checkPageCtrl() => _pageController.hasClients;

  goToPrevPage(PageController controller) {
    print('>>${controller.page}');
    checkPageCtrl()
        ? controller.previousPage(
            duration: Duration(milliseconds: _milliDuration), curve: _curve)
        : VoidCallback;
  }

  goToNextPage(PageController controller) {
    checkPageCtrl()
        ? controller.nextPage(
            duration: Duration(milliseconds: _milliDuration), curve: _curve)
        : VoidCallback;
  }

  @override
  void initState() {
    super.initState();
    _registState = 0;
    _registStateText = 'ข้อมูลส่วนตัว';

    _pageController.addListener(() {
      setState(() {
        _pageController = _pageController;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
        child: PagePadding(
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          RegisterLayout(
            child: RegisterPage1(),
            registerStep: 0,
            stateTitle: 'ข้อมูลส่วนตัว',
            prevBtnFuntion: () => goToPrevPage(_pageController),
            nextBtnFuntion: () => goToNextPage(_pageController),
          ),
          RegisterLayout(
            child: RegisterPage2(),
            registerStep: 1,
            stateTitle: 'เลือกรูปโปรไฟล์',
            prevBtnFuntion: () => goToPrevPage(_pageController),
            nextBtnFuntion: () => goToNextPage(_pageController),
          ),
          RegisterLayout(
            child: RegisterPage1(),
            registerStep: 2,
            stateTitle: 'คุณคือ...?',
            prevBtnFuntion: () => goToPrevPage(_pageController),
            nextBtnFuntion: () => goToNextPage(_pageController),
          ),
          RegisterLayout(
            child: RegisterPage1(),
            registerStep: 3,
            stateTitle: 'เลือกสิ่งที่คุณสนใจ',
            stateSubTitle: 'การกำหนดสิ่งที่คุณสนใจจะช่วยทำให้...',
            prevBtnFuntion: () => goToPrevPage(_pageController),
            nextBtnFuntion: () => goToNextPage(_pageController),
          ),
        ],
      ),
    ));
  }
}
