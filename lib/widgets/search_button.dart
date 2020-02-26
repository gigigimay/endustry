import 'package:endustry/export.dart';
import 'package:endustry/pages/search/search_page.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key key, this.initMode}) : super(key: key);

  final initMode;

  @override
  Widget build(BuildContext context) {
    return IconButtonInk(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SearchPage(
                  initMode: this.initMode,
                )));
      },
      icon: Icon(Icons.search),
    );
  }
}
