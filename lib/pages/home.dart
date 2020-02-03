import 'package:flutter/material.dart';
import '../widgets/bg_layout.dart';
import '../widgets/title_text.dart';
import '../constants.dart' as CONSTANT;

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BgLayout(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(CONSTANT.XL, CONSTANT.MD, CONSTANT.XL, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleText('กระทรวง'),
                    TitleText('อุตสาหกรรม', fontSize: 50.0, height: 0.8),
                  ],
                ),
                const SizedBox(height: CONSTANT.XX),
                SearchBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
