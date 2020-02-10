import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import './tab_menu.dart';
import './service_item.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({
    Key key,
    this.servicesData,
    this.departmentsData,
    this.depsData,
  }) : super(key: key);

  final List<Service> servicesData;
  final List<Department> departmentsData;
  final List depsData;

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  String _selectedItem = 'บริการทั้งหมด';

  void onChangeTab(String value) {
    setState(() {
      _selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List listData = _selectedItem == 'บริการทั้งหมด'
        ? widget.servicesData
        : widget.departmentsData;

    return Column(
      children: <Widget>[
        TabMenu(
          items: ['บริการทั้งหมด', 'หน่วยงาน'],
          selectedItem: _selectedItem,
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
              children: listData
                  .map((item) => ServiceItem(text: item.name))
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: CONSTANT.SIZE_XL)
      ],
    );
  }
}
