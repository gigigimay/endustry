import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';

class AllServicesOfDepList extends StatelessWidget {
  const AllServicesOfDepList({
    Key key,
    @required this.serviceButtonWidth,
    @required this.services,
    @required this.currentTab,
    @required this.width,
  }) : super(key: key);

  final double serviceButtonWidth;
  final List<Service> services;
  final String currentTab;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
              padding: EdgeInsets.symmetric(horizontal: CONSTANT.SIZE_SM),
              child: GradientButton(
                onPressed: () => Utils.navigatePush(
                    context,
                    ServiceInPage(
                      serviceData: s,
                      currentTab: currentTab,
                    )),
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
                      image: s.image != null
                          ? AssetImage(s.image)
                          : AssetImage(CONSTANT.PIC),
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
      )
    ]);
  }
}
