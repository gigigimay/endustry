import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledge_fav.dart';
import 'package:endustry/widgets/knowledge.dart/knowledge_item.dart';

class KnowledgeFeedPage extends StatefulWidget {
  KnowledgeFeedPage({Key key, this.itemOnPressed, this.goToKnowFavPage})
      : super(key: key);

// รอรับค่าจากข้างนอก
  final suggestKnowledgeData = MOCK_KNOWLEDGES.reversed.toList();
  final knowledgeData = MOCK_KNOWLEDGES;
  final List favList = MOCK_USER.favKnowledges;

  final Function itemOnPressed, goToKnowFavPage;

  @override
  _KnowledgeFeedPageState createState() => _KnowledgeFeedPageState();
}

class _KnowledgeFeedPageState extends State<KnowledgeFeedPage> {
  bool isSuggest = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        PageAppBar(
          title: 'คลังความรู้',
          actionWidget: Row(
            children: <Widget>[
              SearchButton(),
              IconButtonInk(
                icon: ImageIcon(
                  AssetImage('assets/images/fav.png'),
                  color: CONSTANT.COLOR_PRIMARY,
                ),
                onPressed: () {
                  widget.goToKnowFavPage();
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
                            borderRadius:
                                BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
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
                              fontWeight:
                                  isSuggest ? FontWeight.w300 : FontWeight.w700,
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
                              favStatus: widget.favList.contains(item.id),
                              itemOnPressed: widget.itemOnPressed,
                            ))
                        .toList(),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
