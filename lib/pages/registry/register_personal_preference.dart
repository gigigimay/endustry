import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/registry/prefer_chip.dart';

class RegisterPage4 extends StatefulWidget {
  RegisterPage4({
    Key key,
  }) : super(key: key);

  @override
  _RegisterPage4State createState() => _RegisterPage4State();
}

class _RegisterPage4State extends State<RegisterPage4> {
  var items = MOCK_KEYWORDS;
  var searchword = '';
  final _textEditingController = TextEditingController();

  List<String> preferList = [];

  @override
  Widget build(BuildContext context) {
    print(preferList);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  style: CONSTANT.TEXT_STYLE_BODY,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: CONSTANT.COLOR_PRIMARY,
                    ),
                    hintText: CONSTANT.WORD_SEARCH_TH,
                    hintStyle: TextStyle(
                      fontSize: CONSTANT.FONT_SIZE_BODY,
                      color: CONSTANT.COLOR_DISABLED,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      searchword = _textEditingController.text;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: CONSTANT.SIZE_XX,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 4,
                spacing: 8,
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: items
                    .where((item) => item.name.contains(searchword))
                    .map((item) {
                  bool isSelected = preferList.contains(item.id);
                  return PreferChip(
                    text: item.name,
                    isSelected: isSelected,
                    onPressed: () => setState(() {
                      isSelected
                          ? preferList.remove(item)
                          : preferList.add(item.id);
                    }),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
