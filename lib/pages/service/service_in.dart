import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class ServiceInPage extends StatelessWidget {
  const ServiceInPage({
    Key key,
    @required this.serviceData,
  }) : super(key: key);

  final Service serviceData;
  final List<Department> departmentsData = MOCK_DEPARTMENT;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BgLayout(
      navbar: NavigationBar(currentpage: 'service'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'บริการ',
            actionWidget: SearchButton(),
            hasBackArrow: true,
          ),
          SizedBox(height: CONSTANT.SIZE_MD),
          PageScrollBody(
            child: PagePadding(
              child: Column(
                children: <Widget>[Text(serviceData.name)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
