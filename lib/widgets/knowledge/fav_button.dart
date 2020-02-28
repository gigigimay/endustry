import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/storage.dart';

class FavButton extends StatefulWidget {
  FavButton({Key key, this.knwId}) : super(key: key);

  final knwId;

  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool _favStatus = false;

  onPressed() {
    setState(() {
      _favStatus
          ? Storage.user.favKnowledges.remove(widget.knwId)
          : Storage.user.favKnowledges.add(widget.knwId);
    });
    // TODO: update database
    print(Storage.user.favKnowledges);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _favStatus = Storage.user.favKnowledges.contains(widget.knwId);

    return IconButtonInk(
      icon: Icon(
        _favStatus ? Icons.star : Icons.star_border,
        color: CONSTANT.COLOR_PRIMARY,
        size: CONSTANT.SIZE_LG + 2.0,
      ),
      onPressed: onPressed,
    );
  }
}
