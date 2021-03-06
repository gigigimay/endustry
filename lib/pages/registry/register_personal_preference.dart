import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/registry/register_layout.dart';
import 'package:endustry/widgets/registry/prefer_chip.dart';

class RegisterPage4 extends StatefulWidget {
  RegisterPage4(
      {Key key,
      this.initData,
      this.onPressed,
      this.prevBtnFuntion,
      this.nextBtnFuntion})
      : super(key: key);

  final Function onPressed, prevBtnFuntion, nextBtnFuntion;
  final initData;

  @override
  _RegisterPage4State createState() => _RegisterPage4State();
}

class _RegisterPage4State extends State<RegisterPage4> {
  var items = MOCK_KEYWORDS;
  var searchword = '';
  final _textEditingController = TextEditingController();

  List _preferList = [];

  @override
  void initState() {
    super.initState();
    _preferList = widget.initData['interestTopic'];
  }

  onClearSearch() {
    _textEditingController.clear();
    setState(() {
      searchword = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredKeywords = items
        .where((item) =>
            !CONSTANT.USERTYPE_KW_IDS.contains(item.id) &&
            (item.name.toLowerCase().contains(searchword.toLowerCase())))
        .toList();

    filteredKeywords.sort((a, b) => a.name.compareTo(b.name));
    return RegisterLayout(
      scroll: false,
      registerStep: 3,
      stateTitle: 'เลือกสิ่งที่คุณสนใจ',
      stateSubTitle: CONSTANT.DESC_INTEREDTESTOPIC,
      prevBtnFuntion: widget.prevBtnFuntion,
      nextBtnFuntion: widget.nextBtnFuntion,
      nextText: 'เสร็จสิ้น',
      child: Expanded(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Input(
                    controller: _textEditingController,
                    prefixIcon:
                        Icon(Icons.search, color: CONSTANT.COLOR_PRIMARY),
                    hintText: CONSTANT.WORD_SEARCH_TH,
                    onChanged: (text) {
                      setState(() {
                        searchword = _textEditingController.text;
                      });
                    },
                    suffixIcon: searchword != null && searchword.isNotEmpty
                        ? IconButtonInk(
                            padding: EdgeInsets.all(0),
                            onPressed: onClearSearch,
                            icon: Icon(Icons.clear),
                          )
                        : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: CONSTANT.SIZE_XX),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 4,
                  spacing: 8,
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: filteredKeywords
                      .map((item) {
                    bool isSelected = _preferList.contains(item.id);
                    return PreferChip(
                        text: item.name,
                        isSelected: isSelected,
                        onPressed: () {
                          setState(() {
                            isSelected
                                ? _preferList.remove(item.id)
                                : _preferList.add(item.id);
                          });
                          widget.onPressed(_preferList);
                        });
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
