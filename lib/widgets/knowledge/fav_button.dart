import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledge_in.dart';
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/knowledge/fav_button.dart';

class FavButton extends StatefulWidget {
  FavButton({Key key,this.knwId}) : super(key: key);
  
  final knwId;

  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {

  bool _favStatus = false;

  @override
  Widget build(BuildContext context) {
    
    return IconButton(
      icon: Icon(
        _favStatus ? Icons.star : Icons.star_border,
        color: CONSTANT.COLOR_PRIMARY,
        size: CONSTANT.SIZE_LG + 2.0,
      ),
      onPressed: (){},
    );
  }
}
