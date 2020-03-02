import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/department_in.dart';
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
        case CONSTANT.WORD_DEPARTMENT_TH: // หน่วยงาน
          return widget.departmentsData
              .map((Department item) => ServiceItem(
                    text: item.name,
                    imageUrl: item.image,
                    onPressed: () => Utils.navigatePush(
                        context, DepartmentInPage(departmentData: item)),
                  ))
              .toList();
        case CONSTANT.WORD_SERVICE_ALL_TH: // บริการทั้งหมด
        default:
          return widget.servicesData
              .map((Service item) => ServiceItem(
                    text: item.name,
                    imageUrl: item.image,
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
          offset: Offset(0, -CONSTANT.SIZE_XL),
          child: RoundedBox(
            padding: EdgeInsets.symmetric(
              horizontal: CONSTANT.SIZE_XL,
              vertical: CONSTANT.SIZE_XX,
            ),
            child: Wrap(
              spacing: CONSTANT.SIZE_XL,
              runSpacing: CONSTANT.SIZE_XX,
              children: getItems(),
            ),
          ),
        ),
        SizedBox(height: CONSTANT.SIZE_XL)
      ],
    );
  }
}
