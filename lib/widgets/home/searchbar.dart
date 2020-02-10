import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/search/searchPage.dart';

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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        elevation: 0,
        color: Colors.white,
        splashColor: Colors.purple[50],
        highlightColor: Colors.purple[50],
        textColor: Theme.of(context).disabledColor,
        padding: EdgeInsets.symmetric(
            vertical: CONSTANT.SIZE_MD, horizontal: CONSTANT.SIZE_LG),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
              size: CONSTANT.SIZE_XX,
            ),
            const SizedBox(width: CONSTANT.SIZE_MD),
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
