import 'package:endustry/export.dart';
import 'package:endustry/pages/searchPage.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButtonInk(
      onPressed: () => print('search'),
      icon: Icon(Icons.search),
    );
  }
}
