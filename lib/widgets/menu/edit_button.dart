import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class EditButton extends StatelessWidget {
  const EditButton({Key key, @required this.onTap, this.text = 'แก้ไข'})
      : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: CONSTANT.TEXT_STYLE_BODY_PRIMARY,
          ),
          SizedBox(width: CONSTANT.SIZE_MD),
          Icon(
            Icons.edit,
            color: CONSTANT.COLOR_PRIMARY,
            size: CONSTANT.SIZE_XL,
          )
        ],
      ),
    );
  }
}
