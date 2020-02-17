import 'package:endustry/export.dart';
import 'package:endustry/pages/registry/register_layout.dart';
import 'package:endustry/pages/registry/register_personal_image.dart';
import 'package:endustry/pages/registry/register_personal_info.dart';
import 'package:endustry/pages/registry/register_personal_preference.dart';
import 'package:endustry/pages/registry/register_personal_status.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool canNext;

  final _milliDuration = 300;
  final _curve = Curves.easeIn;

  PageController _pageController = PageController(initialPage: 0);

  checkPageCtrl() => _pageController.hasClients;

  goToPrevPage(PageController controller) {
    if (checkPageCtrl()) {
      controller.previousPage(
          duration: Duration(milliseconds: _milliDuration), curve: _curve);
    }
  }

  goToNextPage(PageController controller) {
    if (checkPageCtrl()) {
      controller.nextPage(
          duration: Duration(milliseconds: _milliDuration), curve: _curve);
    }
  }

  submitData() {
    // TODO: save all data & update db
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false);
  }

  // TODO: change next text after some activity 1,2,3

  @override
  void initState() {
    super.initState();
    canNext = false;

    _pageController.addListener(() {
      setState(() {
        _pageController = _pageController;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BgLayout(
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
          nextText: canNext ? 'ต่อไป' : 'ข้าม',
          // nextText: ,
        ),
        RegisterLayout(
          child: RegisterPage3(),
          registerStep: 2,
          stateTitle: 'คุณคือ...?',
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => goToNextPage(_pageController),
        ),
        RegisterLayout(
          child: RegisterPage4(),
          registerStep: 3,
          stateTitle: 'เลือกสิ่งที่คุณสนใจ',
          stateSubTitle: 'การกำหนดสิ่งที่คุณสนใจจะช่วยทำให้...',
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => submitData(),
          nextText: 'เสร็จสิ้น',
        ),
      ],
    ));
  }
}
