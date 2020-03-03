import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class PreferChip extends StatelessWidget {
  const PreferChip(
      {Key key, this.text, this.isSelected = false, this.onPressed, this.bgColor = CONSTANT.COLOR_BACKGROUND})
      : super(key: key);

  final String text;
  final bool isSelected;
  final Function onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      pressElevation: 0,
      backgroundColor: isSelected ? CONSTANT.COLOR_PRIMARY : bgColor,
      shape: StadiumBorder(side: BorderSide(color: CONSTANT.COLOR_PRIMARY)),
      label: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : CONSTANT.COLOR_PRIMARY,
        ),
      ),
    );
  }
}
