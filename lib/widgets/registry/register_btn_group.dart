import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class RegisterBtnGroup extends StatelessWidget {
  const RegisterBtnGroup(
      {Key key,
      this.nextText,
      this.nextBtnFuntion,
      this.backText,
      this.prevBtnFuntion,
      this.disabled = false})
      : super(key: key);

  final String backText, nextText;
  final Function() nextBtnFuntion, prevBtnFuntion;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: CONSTANT.SIZE_XL, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: CONSTANT.SIZE_MD),
              child: CustomOutlineButton(
                onPressed: prevBtnFuntion,
                text: backText,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: CONSTANT.SIZE_MD),
              child: GradientButton(
                disabled: disabled,
                text: nextText,
                onPressed: nextBtnFuntion,
              ),
            ),
          )
        ],
      ),
    );
  }
}
