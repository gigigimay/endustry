import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/firebase.dart';
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/menu/edit_profile_layout.dart';
import 'package:endustry/widgets/registry/prefer_chip.dart';

class EditKeywordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EditKeywordForm();
  }
}

class EditKeywordForm extends StatefulWidget {
  final User userData = Storage.user;
  final List<Keyword> keywordsData = MOCK_KEYWORDS;

  @override
  _EditKeywordFormState createState() => _EditKeywordFormState();
}

class _EditKeywordFormState extends State<EditKeywordForm> {
  String _searchValue;
  List<String> _preferList;

  TextEditingController _searchFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _preferList = widget.userData.interestedTopics ?? [];
  }

  void submitForm() async {
    FirebaseDB _firebaseDB = FirebaseDB();
    _firebaseDB.editUserKeyword(_firebaseDB.user,_preferList);
    // await Storage().editUserKeyword(widget.userData.id, _preferList);
    Navigator.pop(context, true);
  }

  onSearch(String value) {
    setState(() {
      _searchValue = value;
    });
  }

  onClearSearch() {
    _searchFieldCtrl.clear();
    setState(() {
      _searchValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String descriptionText =
        'เลือกสิ่งที่คุณสนใจ เพื่อให้เราสามารถแนะนำคอนเทนต์ดีๆ ที่เหมาะกับคุณได้มากขึ้น!';

    return EditProfileLayout(
      title: 'ตั้งค่าสิ่งที่สนใจ',
      marginTop: CONSTANT.FONT_SIZE_HEAD + CONSTANT.SIZE_XS + CONSTANT.SIZE_XL,
      bottomOverlap: CONSTANT.FONT_SIZE_HEAD + CONSTANT.SIZE_XS,
      bottomWidget: GradientButton(
        text: 'ยืนยัน',
        onPressed: submitForm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'สิ่งที่คุณสนใจ',
            style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
          ),
          Text(descriptionText),
          SizedBox(height: CONSTANT.SIZE_LG),
          Input(
            controller: _searchFieldCtrl,
            hintText: 'ค้นหา',
            prefixIcon: Icon(Icons.search),
            onChanged: onSearch,
            suffixIcon: _searchValue != null && _searchValue.isNotEmpty
                ? IconButtonInk(
                    padding: EdgeInsets.all(0),
                    onPressed: onClearSearch,
                    icon: Icon(Icons.clear),
                  )
                : null,
          ),
          PageScrollBody(
              child: Center(
            child: Wrap(
              runSpacing: 4,
              spacing: 8,
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: widget.keywordsData
                  .where((item) => _searchValue != null
                      ? item.name.contains(_searchValue)
                      : true)
                  .map((item) {
                bool isSelected = _preferList.contains(item.id);
                return PreferChip(
                  text: item.name,
                  bgColor: Colors.white,
                  isSelected: isSelected,
                  onPressed: () => setState(() {
                    isSelected
                        ? _preferList.remove(item.id)
                        : _preferList.add(item.id);
                  }),
                );
              }).toList(),
            ),
          )),
        ],
      ),
    );
  }
}
