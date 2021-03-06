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
  String _searchValue = '';
  List<String> _preferList;
  bool _isLoading = false;

  TextEditingController _searchFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _preferList = widget.userData.interestedTopics ?? [];
  }

  void submitForm() async {
    FirebaseDB _firebaseDB = FirebaseDB();
    setLoading(true);
    await _firebaseDB.editUserKeyword(_preferList);
    Storage().generateInterest();
    setLoading(false);
    Navigator.pop(context, true);
  }

  setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  onSearch(String value) {
    setState(() {
      _searchValue = value;
    });
  }

  onClearSearch() {
    _searchFieldCtrl.clear();
    onSearch('');
  }

  @override
  Widget build(BuildContext context) {
    final String descriptionText = CONSTANT.DESC_INTEREDTESTOPIC;

    final filteredKeywords = widget.keywordsData
        .where((item) =>
            !CONSTANT.USERTYPE_KW_IDS.contains(item.id) &&
            (item.name.toLowerCase().contains(_searchValue.toLowerCase())))
        .toList();

    filteredKeywords.sort((a, b) => a.name.compareTo(b.name));

    return CustomLoadingOverlay(
      isLoading: _isLoading,
      child: EditProfileLayout(
        title: 'ตั้งค่าสิ่งที่สนใจ',
        marginTop:
            CONSTANT.FONT_SIZE_HEAD + CONSTANT.SIZE_XS + CONSTANT.SIZE_XL,
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
                children: filteredKeywords.map((item) {
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
      ),
    );
  }
}
