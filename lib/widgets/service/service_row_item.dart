import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';

class ServiceRowItem extends StatelessWidget {
  const ServiceRowItem({
    Key key,
    @required this.serviceData,
    @required this.departmentData,
    this.extraWidgets,
    this.currentTab = 'service',
  }) : super(key: key);

  final Service serviceData;
  final Department departmentData;
  final List<Widget> Function(Service) extraWidgets;
  final String currentTab;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return FlatButton(
        padding: EdgeInsets.all(CONSTANT.SIZE_MD),
        onPressed: () => Utils.navigatePush(
            context,
            ServiceInPage(
              serviceData: serviceData,
              currentTab: currentTab,
            )),
        child: Row(
          children: <Widget>[
            CircleFadeInImage(
              size: width * 0.25,
              image: AssetImage(serviceData.image ?? CONSTANT.PIC),
            ),
            SizedBox(width: CONSTANT.SIZE_LG),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                      Text(
                        serviceData.name,
                        style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        departmentData.name,
                        style: TextStyle(fontWeight: FontWeight.w300),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ] +
                    (extraWidgets != null ? extraWidgets(serviceData) : []),
              ),
            )
          ],
        ));
  }
}
