import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class Input extends StatelessWidget {
  const Input({
    Key key,
    this.hintText,
    this.initialValue = '',
    this.validator,
    this.suffixIcon,
    this.suffixText,
    this.obscureText = false,
    this.readOnly = false,
  }) : super(key: key);

  final String hintText;
  final bool obscureText, readOnly;
  final String initialValue, suffixText;
  final Function validator;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    String validate(String value) {
      if (value.length == 0) return 'กรุณากรอกข้อมูล';
      return validator != null ? validator(value) : null;
    }

    return Container(
      padding: EdgeInsets.only(bottom: CONSTANT.SIZE_MD),
      child: TextFormField(
        initialValue: initialValue,
        readOnly: readOnly,
        obscureText: obscureText,
        validator: validate,
        style: TextStyle(fontSize: CONSTANT.FONT_SIZE_HEAD),
        decoration: InputDecoration(
            suffixText: suffixText,
            suffixStyle: TextStyle(
                color: CONSTANT.COLOR_PRIMARY,
                fontSize: CONSTANT.FONT_SIZE_BODY,
                fontWeight: FontWeight.w700),
            suffixIcon: suffixIcon,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: CONSTANT.SIZE_SM)),
      ),
    );
  }
}
