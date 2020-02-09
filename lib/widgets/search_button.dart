import 'package:endustry/export.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButtonInk(
      onTap: () => print('search'),
      icon: Icon(Icons.search),
      color: Theme.of(context).primaryColor,
    );
  }
}
