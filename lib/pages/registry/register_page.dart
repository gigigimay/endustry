import 'package:endustry/export.dart';
import 'package:endustry/firebase.dart';
import 'package:endustry/pages/login.dart';
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
  PageController _pageController = PageController(initialPage: 0);

  checkPageCtrl() => _pageController.hasClients;

  var userInfo = {
    'firstName': '',
    'lastName': '',
    'email': '',
    'password': '',
    'typeId': '',
    'img': Utils.convertByteCodeToString(kTransparentImage),
    'interestTopic': []
  };

  goToLoginPage() {
    Navigator.pop(context);
  }

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

  nextP1({firstname, lastname, email, password}) {
    userInfo['firstName'] = firstname;
    userInfo['lastName'] = lastname;
    userInfo['email'] = email;
    userInfo['password'] = password;

    goToNextPage(_pageController);
  }

  nextP2(img) {
    userInfo['img'] = img;
    goToNextPage(_pageController);
  }

  nextP3(typeId) {
    userInfo['typeId'] = typeId;
    goToNextPage(_pageController);
  }

  saveP4(interestTopic) {
    userInfo['interestTopic'] = interestTopic;
  }

  submitData() {
    User newUser = User(
        id: null,
        firstName: userInfo['firstName'],
        lastName: userInfo['lastName'],
        email: userInfo['email'],
        password: userInfo['password'],
        img: userInfo['img'],
        typeId: userInfo['typeId'],
        interestedTopics: List<String>.from(userInfo['interestTopic']));

    FirebaseDB _firebasedb = FirebaseDB();
    _firebasedb.register(newUser, Utils.encode(userInfo['password']));

    Navigator.pop(context);
    Utils.navigatePush(context, LoginPage(initMail: userInfo['email']));
  }

  @override
  void initState() {
    super.initState();

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
        RegisterPage1(
          initData: userInfo,
          prevBtnFuntion: () => Navigator.pop(context),
          nextBtnFuntion: nextP1,
        ),
        RegisterPage2(
          initData: userInfo,
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: nextP2,
        ),
        RegisterPage3(
          initData: userInfo,
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: nextP3,
        ),
        RegisterPage4(
          initData: userInfo,
          onPressed: saveP4,
          prevBtnFuntion: () => goToPrevPage(_pageController),
          nextBtnFuntion: submitData,
        ),
      ],
    ));
  }
}
