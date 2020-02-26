import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';

class DepartmentInPage extends StatelessWidget {
  const DepartmentInPage({
    Key key,
    @required this.departmentData,
  }) : super(key: key);

  final Department departmentData;
  final List<Service> servicesData = MOCK_SERVICES;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageSize = width * 0.35;
    double serviceButtonWidth = width * 0.4;

    List<Service> services = MOCK_SERVICES
        .where((Service s) => s.depId == departmentData.id)
        .toList();

    return BgLayout(
      navbar: NavigationBar(currentTab: 'service'),
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
                          size: imageSize,
                          imageUrl: departmentData.image,
                        ),
                      )
                    ],
                  ),
                ),
                PagePadding(
                  top: CONSTANT.SIZE_XL,
                  child: Text(CONSTANT.WORD_SERVICE_ALL_TH,
                      style: CONSTANT.TEXT_STYLE_HEADING),
                ),
                SizedBox(height: CONSTANT.SIZE_SM),
                Container(
                  height: serviceButtonWidth * 1.2,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: CONSTANT.SIZE_XL - CONSTANT.SIZE_SM),
                    scrollDirection: Axis.horizontal,
                    itemCount: services.length,
                    itemBuilder: (BuildContext context, int index) {
                      Service s = services[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: CONSTANT.SIZE_SM),
                        child: GradientButton(
                          onPressed: () => Utils.navigatePush(
                              context, ServiceInPage(serviceData: s)),
                          padding: EdgeInsets.symmetric(
                            vertical: CONSTANT.SIZE_SM,
                            horizontal: CONSTANT.SIZE_MD,
                          ),
                          gradientBegin: Alignment.topCenter,
                          gradientEnd: Alignment.bottomCenter,
                          borderRadius: CONSTANT.BORDER_RADIUS,
                          width: serviceButtonWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleFadeInImage(
                                size: serviceButtonWidth * 0.6,
                                borderWidth: CONSTANT.BORDER_WIDTH_MEDIUM,
                                borderColor: Colors.white,
                                imageUrl: s.image,
                              ),
                              SizedBox(height: CONSTANT.SIZE_SM),
                              Text(
                                s.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
