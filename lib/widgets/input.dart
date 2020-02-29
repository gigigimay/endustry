import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class Input extends StatelessWidget {
  const Input({
    Key key,
    this.initialValue = '',
    this.obscureText = false,
    this.readOnly = false,
    this.autofocus = false,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.labelText,
    this.validator,
    this.suffixIcon,
    this.suffixText,
    this.style,
    this.prefixIcon,
    this.textInputAction,
    this.keyboardType,
    this.onEditingComplete,
    this.touched,
  }) : super(key: key);

  final String hintText, labelText, initialValue, suffixText;
  final bool obscureText, readOnly, autofocus, touched;
  final Function validator, onChanged, onSaved, onEditingComplete;
  final Widget suffixIcon;
  final TextStyle style;
  final Widget prefixIcon;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    String validate(String value) {
      if (touched != null && !touched) return null;
      if (value.isEmpty) return 'กรุณากรอกข้อมูล';
      return validator != null ? validator(value) : null;
    }

    return Container(
      padding: EdgeInsets.only(bottom: CONSTANT.SIZE_MD),
      child: TextFormField(
        onEditingComplete: onEditingComplete,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        autofocus: autofocus,
        onChanged: onChanged,
        onSaved: onSaved,
        initialValue: initialValue,
        readOnly: readOnly,
        obscureText: obscureText,
        validator: validate,
        style: style,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
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
