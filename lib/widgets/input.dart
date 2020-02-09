
import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class Input extends StatelessWidget {
  const Input({
    Key key,
    this.hintText,
    this.isPassword = false,
    this.initialValue = '',
    this.validator,
  }) : super(key: key);

  final String hintText;
  final bool isPassword;
  final String initialValue;
  final Function validator;

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
        readOnly: isPassword,
        obscureText: isPassword,
        validator: validate,
        style: TextStyle(fontSize: CONSTANT.FONT_SIZE_HEAD),
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: CONSTANT.SIZE_SM)),
      ),
    );
  }
}
