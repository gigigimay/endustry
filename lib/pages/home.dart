import 'package:flutter/material.dart';
import '../widgets/bg_layout.dart';
import '../widgets/title_text.dart';
import '../widgets/searchbar.dart';
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

