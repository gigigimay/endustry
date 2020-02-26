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
    Utils.navigatePushAndPopAll(context, HomePage());
  }

  // TODO: change next text after some activity 1,2,3
  setValid1(bool boolean) {
    setState(() {
      validStep1 = boolean;
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
        RegisterPage1(
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => goToNextPage(_pageController),
        ),
        RegisterPage2(
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => goToNextPage(_pageController),
        ),
        RegisterPage3(
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => goToNextPage(_pageController),
        ),
        RegisterPage4(
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: () => submitData(),
        ),
      ],
    ));
  }
}
