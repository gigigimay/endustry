import 'package:flutter/material.dart';
import '../constants.dart' as CONSTANT;

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [CONSTANT.BOX_SHADOW],
      ),
      child: RaisedButton(
        onPressed: () => print('search!!'),
        elevation: 0,
        color: Colors.white,
        splashColor: Colors.purple[50],
        highlightColor: Colors.purple[50],
        textColor: Theme.of(context).disabledColor,
        padding: EdgeInsets.symmetric(vertical: CONSTANT.MD, horizontal: CONSTANT.LG),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
              size: CONSTANT.XX,
            ),
            const SizedBox(width: CONSTANT.MD),
            Text(
              'ค้นหา',
              style: TextStyle(fontSize: CONSTANT.FONT_SIZE_HEAD),
            )
          ],
        ),
      ),
    );
  }
}
