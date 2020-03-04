import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class Input extends StatelessWidget {
  const Input(
      {Key key,
      this.obscureText = false,
      this.readOnly = false,
      this.autofocus = false,
      this.initialValue,
      this.onChanged,
      this.onSaved,
      this.hintText,
      this.labelText,
      this.validator,
      this.suffixIcon,
      this.suffixText,
      this.style,
      this.hintStyle,
      this.prefixIcon,
      this.textInputAction,
      this.keyboardType,
      this.onEditingComplete,
      this.controller,
      this.fontSize,
      this.focusNode})
      : super(key: key);

  final String hintText, labelText, initialValue, suffixText;
  final bool obscureText, readOnly, autofocus;
  final Function validator, onChanged, onSaved, onEditingComplete;
  final Widget suffixIcon;
  final TextStyle style, hintStyle;
  final Widget prefixIcon;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final double fontSize;
  final FocusNode focusNode;

  String validate(String value) {
    if (value.isEmpty) return 'กรุณากรอกข้อมูล';
    return validator != null ? validator(value) : null;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(bottom: CONSTANT.SIZE_MD),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
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
        style: style ??
            TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: fontSize ?? width * 0.05,
              color: CONSTANT.COLOR_BODY,
            ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hasFloatingPlaceholder: true,
          suffixText: suffixText,
          hintStyle: hintStyle ??
              style ??
              TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: fontSize ?? width * 0.05,
                color: CONSTANT.COLOR_DISABLED,
              ),
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
