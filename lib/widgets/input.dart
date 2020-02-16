import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class Input extends StatelessWidget {
  const Input({
    Key key,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.labelText,
    this.initialValue = '',
    this.validator,
    this.suffixIcon,
    this.suffixText,
    this.obscureText = false,
    this.readOnly = false,
    this.style,
  }) : super(key: key);

  final String hintText, labelText, initialValue, suffixText;
  final bool obscureText, readOnly;
  final Function validator, onChanged, onSaved;
  final Widget suffixIcon;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String validate(String value) {
      if (value.isEmpty) return 'กรุณากรอกข้อมูล';
      return validator != null ? validator(value) : null;
    }

    return Container(
      padding: EdgeInsets.only(bottom: CONSTANT.SIZE_MD),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        initialValue: initialValue,
        readOnly: readOnly,
        obscureText: obscureText,
        validator: validate,
        style: style,
        decoration: InputDecoration(
          hasFloatingPlaceholder: true,
          suffixText: suffixText,
          suffixStyle: TextStyle(
            color: CONSTANT.COLOR_PRIMARY,
            fontSize: CONSTANT.FONT_SIZE_BODY,
            fontWeight: FontWeight.w700,
          ),
          suffixIcon: suffixIcon,
          labelText: labelText,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: CONSTANT.SIZE_SM),
        ),
      ),
    );
  }
}
