import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledge_fav.dart';
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/knowledge/knowledge_item.dart';

class KnowledgePage extends StatefulWidget {
  KnowledgePage({
    Key key,
    this.itemOnPressed,
  }) : super(key: key);

  final suggestKnowledgeData = MOCK_KNOWLEDGES.reversed.toList();
  final knowledgeData = MOCK_KNOWLEDGES;

  final Function itemOnPressed;

  @override
  _KnowledgePageState createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  bool isSuggest = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BgLayout(
      navbar: NavigationBar(currentTab: 'knowledge', isOnRoot: true),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'คลังความรู้',
            actionWidget: Row(
              children: <Widget>[
                SearchButton(initMode: CONSTANT.WORD_KNOWLEDGE_TH),
                IconButtonInk(
                  icon: ImageIcon(
                    AssetImage('assets/images/fav.png'),
                    color: CONSTANT.COLOR_PRIMARY,
                  ),
                  onPressed: () {
                    Utils.navigatePush(
                        context,
                        KnowledgeFavPage(
                            knowledgeData: widget.knowledgeData.where((item) =>
                                Storage.user.favKnowledges.contains(item.id)).toList()));
                  },
                ),
              ],
            ),
          ),
          PageScrollBody(
            child: Column(
              children: <Widget>[
                Container(
                  height: width * 0.15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
                        onPressed: () {
                          setState(() {
                            isSuggest = true;
                          });
                        },
                        child: Text('แนะนำ',
                            style: TextStyle(
                              fontSize: CONSTANT.FONT_SIZE_HEAD,
                              color: isSuggest
                                  ? CONSTANT.COLOR_BODY
                                  : CONSTANT.COLOR_DISABLED,
                              fontWeight:
                                  isSuggest ? FontWeight.w700 : FontWeight.w300,
                            )),
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                        indent: width * 0.04,
                        endIndent: width * 0.04,
                      ),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  CONSTANT.BORDER_RADIUS)),
                          onPressed: () {
                            setState(() {
                              isSuggest = false;
                            });
                          },
                          child: Text('ทั้งหมด',
                              style: TextStyle(
                                fontSize: CONSTANT.FONT_SIZE_HEAD,
                                color: isSuggest
                                    ? CONSTANT.COLOR_DISABLED
                                    : CONSTANT.COLOR_BODY,
                                fontWeight: isSuggest
                                    ? FontWeight.w300
                                    : FontWeight.w700,
                              ))),
                    ],
                  ),
                ),
                PagePadding(
                    top: 0.0,
                    child: Column(
                      children: (isSuggest
                              ? widget.suggestKnowledgeData
                              : widget.knowledgeData)
                          .map((item) => KnowledgeItem(
                                knowledgeData: item,
                              ))
                          .toList(),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
