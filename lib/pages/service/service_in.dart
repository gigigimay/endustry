import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/department_in.dart';
import 'package:endustry/storage.dart';

class ServiceInPage extends StatelessWidget {
  const ServiceInPage({
    Key key,
    @required this.serviceData,
    this.currentTab = 'service',
  }) : super(key: key);

  final Service serviceData;
  final List<Department> departmentsData = MOCK_DEPARTMENT;
  final String currentTab;

  gotoUrl() {
    Storage().addServiceHistory(serviceData);
    Utils.launchURL(serviceData.url);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageSize = width * 0.35;

    Department dep =
        departmentsData.firstWhere((Department d) => d.id == serviceData.depId);

    return BgLayout(
      navbar: NavigationBar(currentTab: currentTab),
      child: Column(
        children: <Widget>[
          PageAppBar(title: 'บริการ', hasBackArrow: true),
          PageScrollBody(
            child: PagePadding(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      RoundedBox(
                        margin: EdgeInsets.only(top: imageSize / 2),
                        padding: EdgeInsets.all(CONSTANT.SIZE_XL),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: imageSize / 2),
                              Text(
                                serviceData.name,
                                textAlign: TextAlign.center,
                                style: CONSTANT.TEXT_STYLE_HEADING,
                              ),
                              FlatButton(
                                onPressed: () => Utils.navigatePush(
                                    context,
                                    DepartmentInPage(
                                      departmentData: dep,
                                      currentTab: currentTab,
                                    )),
                                child: Text(
                                  dep.name,
                                  textAlign: TextAlign.center,
                                  style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
                                ),
                              ),
                              SizedBox(height: CONSTANT.SIZE_XS),
                              GradientButton(
                                onPressed: gotoUrl,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: CONSTANT.SIZE_XS),
                                  child: Center(
                                    child: Text(
                                      'เข้าใช้งานบริการ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: CircleFadeInImage(
                          size: imageSize,
                          image: serviceData.image != null
                              ? NetworkImage(serviceData.image, scale: 1)
                              : AssetImage('assets/images/pic.png'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: CONSTANT.SIZE_XL),
                  RoundedBox(
                    padding: EdgeInsets.symmetric(
                      vertical: CONSTANT.SIZE_XL,
                      horizontal: CONSTANT.SIZE_MD,
                    ),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Text(
                          'รายละเอียดเกี่ยวกับบริการ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )),
                        SizedBox(height: CONSTANT.SIZE_SM),
                        Text(serviceData.description)
                      ],
                    ),
                  ),
                  SizedBox(height: CONSTANT.SIZE_XX),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
