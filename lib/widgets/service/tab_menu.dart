import 'package:endustry/export.dart';
import './tab_menu_item.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({
    Key key,
    this.items,
    this.selectedItem,
  }) : super(key: key);

  final List<String> items;
  final String selectedItem;

  Widget renderItem(String item) =>
      TabMenuItem(isSelected: selectedItem == item, text: item);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: items != null
          ? items.map(renderItem).toList()
          : <Widget>[Container()],
    );
  }
}
