import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class RegisterBtnGroup extends StatelessWidget {
  const RegisterBtnGroup({Key key, this.nextBtnFuntion, this.prevBtnFuntion})
      : super(key: key);

  final Function() nextBtnFuntion, prevBtnFuntion;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: CONSTANT.SIZE_XL, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: width * 0.38,
            child: FlatButton(
                padding: EdgeInsets.symmetric(
                  vertical: CONSTANT.SIZE_SM,
                  horizontal: CONSTANT.SIZE_XX,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                  side: BorderSide(
                    color: CONSTANT.COLOR_PRIMARY,
                  ),
                ),
                child: Text(
                  'ย้อนกลับ',
                  style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
                ),
                onPressed: prevBtnFuntion),
          ),
          GradientButton(
              width: width * 0.38,
              child: Center(
                child: Text(
                  'ต่อไป',
                  style: TextStyle(
                      fontSize: CONSTANT.FONT_SIZE_HEAD,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              onPressed: nextBtnFuntion)
        ],
      ),
    );
  }
}
