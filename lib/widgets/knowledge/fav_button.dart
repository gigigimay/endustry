import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/firebase.dart';
import 'package:endustry/storage.dart';

class FavButton extends StatefulWidget {
  FavButton({Key key, this.knwId, this.size}) : super(key: key);

  final String knwId;
  final double size;

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
    FirebaseDB firebaseDB = FirebaseDB();
    firebaseDB.updateUserFav(Storage.user.favKnowledges);
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
        size: widget.size ?? CONSTANT.FONT_SIZE_HEAD,
      ),
      onPressed: onPressed,
    );
  }
}
