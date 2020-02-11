import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class SearchField extends StatelessWidget {
  SearchField(
      {Key key, this.textEditingController, this.onChange, this.onClear})
      : super(key: key);

  TextEditingController textEditingController;
  VoidCallback onClear;
  Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            autofocus: true,
            controller: textEditingController,
            decoration: InputDecoration(
                prefixIcon: IconButtonInk(
                  icon: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                suffixIcon:
                    IconButtonInk(icon: Icon(Icons.close), onTap: onClear),
                contentPadding: EdgeInsets.all(8),
                border: InputBorder.none,
                hintText: CONSTANT.WORD_SEARCH_TH,
                hintStyle:
                    TextStyle(color: CONSTANT.COLOR_DISABLED, height: 0.8)),
            onChanged: (text) {
              onChange(text);
            },
          ),
        ),
      ],
    );
  }
}
