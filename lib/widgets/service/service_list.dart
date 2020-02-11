import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';
import './tab_menu.dart';
import './service_list_item.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({
    Key key,
    this.servicesData,
    this.departmentsData,
  }) : super(key: key);

  final List<Service> servicesData;
  final List<Department> departmentsData;

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  String _selectedTab = CONSTANT.WORD_SERVICE_ALL_TH;

  void onChangeTab(String value) {
    setState(() {
      _selectedTab = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List getItems() {
      switch (_selectedTab) {
        case CONSTANT.WORD_DEPARTMENT_TH:
          return widget.departmentsData
              .map((item) => ServiceItem(
                    text: item.name,
                    onPressed: () => Utils.navigatePush(context, null),
                  ))
              .toList();
        case CONSTANT.WORD_SERVICE_ALL_TH:
        default:
          return widget.servicesData
              .map((item) => ServiceItem(
                    text: item.name,
                    onPressed: () => Utils.navigatePush(
                        context, ServiceInPage(serviceData: item)),
                  ))
              .toList();
      }
    }

    return Column(
      children: <Widget>[
        TabMenu(
          items: [CONSTANT.WORD_SERVICE_ALL_TH, CONSTANT.WORD_DEPARTMENT_TH],
          selectedItem: _selectedTab,
          onChange: onChangeTab,
        ),
        Transform.translate(
          offset: Offset(0, -CONSTANT.SIZE_LG),
          child: RoundedBox(
            padding: EdgeInsets.symmetric(
              horizontal: CONSTANT.SIZE_XL,
              vertical: CONSTANT.SIZE_LG,
            ),
            child: Wrap(
              spacing: CONSTANT.SIZE_XL,
              runSpacing: CONSTANT.SIZE_XL,
              children: getItems(),
            ),
          ),
        ),
        SizedBox(height: CONSTANT.SIZE_XL)
      ],
    );
  }
}
