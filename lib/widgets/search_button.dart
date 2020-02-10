import 'package:endustry/export.dart';
import 'package:endustry/pages/search/searchPage.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButtonInk(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
      },
      icon: Icon(Icons.search),
    );
  }
}
