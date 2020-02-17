import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class RegisterStatusBtn extends StatelessWidget {
  const RegisterStatusBtn(
      {Key key,
      this.text,
      this.isSelected = false,
      this.imgUrl = '',
      this.onTap})
      : super(key: key);

  final String text, imgUrl;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: onTap,
            child: CircleAvatar(
              child: Image(
                image: AssetImage(imgUrl),
              ),
              backgroundColor:
                  isSelected ? Color(0xffEFE4F2) : CONSTANT.COLOR_BACKGROUND,
              radius: width * 0.4 / 2,
            ),
          ),
        ),
        SizedBox(
          height: CONSTANT.SIZE_MD,
        ),
        Text(
          text,
          style: TextStyle(
              color: CONSTANT.COLOR_PRIMARY,
              fontSize: CONSTANT.FONT_SIZE_HEAD,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w300),
        )
      ],
    );
  }
}
