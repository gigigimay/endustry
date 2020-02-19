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
  // TODO: STORE ALL SELECTED DATA
  bool validStep1, validStep2, validStep3, validStep4;

  PageController _pageController = PageController(initialPage: 0);

  checkPageCtrl() => _pageController.hasClients;

  goToPrevPage(PageController controller) {
    if (checkPageCtrl() && controller.page > 0) {
      controller.jumpToPage((controller.page - 1.0).toInt());
    }
  }

  goToNextPage(PageController controller) {
    if (checkPageCtrl()) {
      controller.jumpToPage((controller.page + 1.0).toInt());
    }
  }

  submitData() {
    // TODO: save all data & update db
    Utils.navigatePushAndPopAll(context, '/home');
  }

  // TODO: change next text after some activity 1,2,3
  setValid1(bool boolean) {
    setState(() {
      validStep1 = boolean;
    });
  }

  setValid2(bool boolean) {
    setState(() {
      validStep2 = boolean;
    });
  }

  setValid3(bool boolean) {
    setState(() {
      validStep3 = boolean;
    });
  }

  setValid4(bool boolean) {
    setState(() {
      validStep4 = boolean;
    });
  }

  @override
  void initState() {
    super.initState();
    validStep1 = validStep2 = validStep3 = validStep4 = false;

    _pageController.addListener(() {
      setState(() {
        _pageController = _pageController;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).isCurrent);
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
          child: RegisterPage2(
            onPressed: setValid2,
          ),
          registerStep: 1,
          stateTitle: 'เลือกรูปโปรไฟล์',
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => goToNextPage(_pageController),
          nextText: validStep2 ? 'ต่อไป' : 'ข้าม',
          // nextText: ,
        ),
        RegisterLayout(
          child: RegisterPage3(
            onpressed: setValid3,
          ),
          registerStep: 2,
          stateTitle: 'คุณคือ...?',
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => goToNextPage(_pageController),
          nextText: 'ต่อไป',
          disabled: !validStep3,
        ),
        RegisterLayout(
          child: RegisterPage4(),
          registerStep: 3,
          stateTitle: 'เลือกสิ่งที่คุณสนใจ',
          stateSubTitle: 'การกำหนดสิ่งที่คุณสนใจจะช่วยทำให้...',
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => submitData,
          nextText: 'เสร็จสิ้น',
        ),
      ],
    ));
  }
}
