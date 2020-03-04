import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/service/all_services_of_dep_list.dart';

class DepartmentInPage extends StatelessWidget {
  const DepartmentInPage({
    Key key,
    @required this.departmentData,
    this.currentTab = 'service',
  }) : super(key: key);

  final Department departmentData;
  final List<Service> servicesData = MOCK_SERVICES;
  final String currentTab;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageSize = width * 0.35;
    double serviceButtonWidth = width * 0.4;

    List<Service> services = MOCK_SERVICES
        .where((Service s) => s.depId == departmentData.id)
        .toList();

    return BgLayout(
      navbar: NavigationBar(currentTab: currentTab),
      child: Column(
        children: <Widget>[
          PageAppBar(title: CONSTANT.WORD_DEPARTMENT_TH, hasBackArrow: true),
          PageScrollBody(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PagePadding(
                  child: Stack(
                    children: <Widget>[
                      RoundedBox(
                        margin: EdgeInsets.only(top: imageSize / 2),
                        padding: EdgeInsets.all(CONSTANT.SIZE_XL),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: imageSize / 2),
                              Text(
                                departmentData.name,
                                textAlign: TextAlign.center,
                                style: CONSTANT.TEXT_STYLE_HEADING,
                              ),
                              SizedBox(height: CONSTANT.SIZE_LG),
                              GradientButton(
                                onPressed: () {
                                  Utils.launchURL(departmentData.url);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: CONSTANT.SIZE_XS),
                                  child: Center(
                                    child: Text(
                                      'เข้าสู่เว็บไซต์ของหน่วยงาน',
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
                          padding: EdgeInsets.all(CONSTANT.SIZE_MD),
                          size: imageSize,
                          image: AssetImage(departmentData.image),
                        ),
                      )
                    ],
                  ),
                ),
                services.isNotEmpty
                    ? AllServicesOfDepList(
                        serviceButtonWidth: serviceButtonWidth,
                        services: services,
                        currentTab: currentTab,
                        width: width,
                      )
                    : Container(),
                PagePadding(
                  top: CONSTANT.SIZE_LG,
                  child: Column(
                    children: <Widget>[
                      RoundedBox(
                        padding: EdgeInsets.symmetric(
                          vertical: CONSTANT.SIZE_XL,
                          horizontal: CONSTANT.SIZE_MD,
                        ),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                'เกี่ยวกับหน่วยงาน',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: CONSTANT.FONT_SIZE_BODY + 2,
                                ),
                              ),
                            ),
                            SizedBox(height: CONSTANT.SIZE_SM),
                            Text(departmentData.description)
                          ],
                        ),
                      ),
                      SizedBox(height: CONSTANT.SIZE_XX),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
