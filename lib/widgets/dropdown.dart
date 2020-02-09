import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class Dropdown extends StatelessWidget {
  const Dropdown({
    Key key,
    @required this.valueLabel,
    @required this.title,
    @required this.items,
  }) : super(key: key);

  final String title;
  final valueLabel;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: CONSTANT.TEXT_STYLE_HEADING,
        ),
        SizedBox(width: CONSTANT.SIZE_LG),
        Expanded(
          child: RaisedButton(
            onPressed: () => print('open dropdown'),
            color: CONSTANT.COLOR_PRIMARY,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999)),
            padding: EdgeInsets.only(
                top: CONSTANT.SIZE_XS,
                bottom: CONSTANT.SIZE_XS,
                left: CONSTANT.SIZE_XL,
                right: CONSTANT.SIZE_MD),
            elevation: 0,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(valueLabel,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal)),
                SizedBox(width: CONSTANT.SIZE_MD),
                Icon(
                  Icons.expand_more,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
