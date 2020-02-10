import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class TabMenu extends StatelessWidget {
  const TabMenu({
    Key key,
    this.items,
    this.selectedItem,
    this.onChange,
  }) : super(key: key);

  final List<String> items;
  final String selectedItem;
  final Function(String) onChange;

  Widget renderItem(String item) {
    bool isSelected = item == selectedItem;
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.only(
          top: CONSTANT.SIZE_SM,
          bottom: CONSTANT.SIZE_XL,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CONSTANT.BORDER_RADIUS),
            topRight: Radius.circular(CONSTANT.BORDER_RADIUS),
          ),
        ),
        onPressed: () => onChange(item),
        child: Text(
          item,
          style: TextStyle(
            fontSize: CONSTANT.FONT_SIZE_HEAD,
            color: isSelected ? CONSTANT.COLOR_BODY : CONSTANT.COLOR_DISABLED,
          ),
        ),
        color: isSelected ? Colors.white : null,
      ),
    );
  }

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
