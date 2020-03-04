import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/knowledge/knowledge_item.dart';

class KnowledgeFavPage extends StatefulWidget {
  const KnowledgeFavPage(
      {Key key,
      @required this.knowledgeData,
      this.itemOnPressed,
      this.backArrowFunction})
      : super(key: key);

  final List<Knowledge> knowledgeData;
  final Function itemOnPressed, backArrowFunction;

  @override
  _KnowledgeFavPageState createState() => _KnowledgeFavPageState();
}

class _KnowledgeFavPageState extends State<KnowledgeFavPage> {
  String _searchValue;

  TextEditingController _searchFieldCtrl = TextEditingController();

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
    final double height = MediaQuery.of(context).size.height;

    final bool searched = _searchValue != null && _searchValue.isNotEmpty;
    final String message =
        searched ? 'ไม่พบผลลัพธ์' : 'ยังไม่มีคลังความรู้ของฉัน';

    // TODO: search for keywords
    List<Knowledge> filteredKnowledges = searched
        ? widget.knowledgeData
            .where((Knowledge k) =>
                k.title.toLowerCase().contains(_searchValue.toLowerCase()) ||
                k.content.toLowerCase().contains(_searchValue.toLowerCase()))
            .toList()
        : List.from(widget.knowledgeData);
    filteredKnowledges.sort((a, b) => a.title
        .toString()
        .toLowerCase()
        .compareTo(b.title.toString().toLowerCase()));

    return UnfocusNode(
      child: BgLayout(
        navbar: NavigationBar(currentTab: 'knowledge'),
        child: Column(
          children: <Widget>[
            PageAppBar(
              title: 'คลังความรู้ของฉัน',
              hasBackArrow: true,
              backArrowFunction: widget.backArrowFunction,
            ),
            searched || filteredKnowledges.isNotEmpty
                ? PagePadding(
                    child: Input(
                    hintText: 'ค้นหา',
                    controller: _searchFieldCtrl,
                    prefixIcon: Icon(Icons.search),
                    onChanged: onSearch,
                    suffixIcon: searched
                        ? IconButtonInk(
                            padding: EdgeInsets.all(0),
                            onPressed: onClearSearch,
                            icon: Icon(Icons.clear),
                          )
                        : null,
                  ))
                : Container(),
            filteredKnowledges.isNotEmpty
                ? PageScrollBody(
                    child: PagePadding(
                      top: 0.0,
                      child: Column(
                        children: filteredKnowledges
                            .map((item) => KnowledgeItem(
                                  knowledgeData: item,
                                  itemOnPressed: widget.itemOnPressed,
                                ))
                            .toList(),
                      ),
                    ),
                  )
                : PagePadding(
                    top: height * (searched ? 0.05 : 0.1),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: CONSTANT.FONT_SIZE_HEAD,
                          color: CONSTANT.COLOR_DISABLED,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
