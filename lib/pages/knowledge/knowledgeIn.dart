import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class KnowledgeInPage extends StatefulWidget {
  KnowledgeInPage({Key key, this.knowledgeData, this.favStatus})
      : super(key: key);

  Knowledge knowledgeData;
  bool favStatus;

  @override
  _KnowledgeInPageState createState() => _KnowledgeInPageState();
}

class _KnowledgeInPageState extends State<KnowledgeInPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BgLayout(
      navbar: NavigationBar(currentpage: 'knowledge'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'คลังความรู้',
            hasBackArrow: true,
            backArrowFunction: () {
              Navigator.pop(context);
            },
            actionWidget: IconButtonInk(
              icon: Icon(
                widget.favStatus ? Icons.star : Icons.star_border,
                color: CONSTANT.COLOR_PRIMARY,
                size: CONSTANT.SIZE_XL,
              ),
              onTap: () {
                setState(() {
                  widget.favStatus = !widget.favStatus;
                });
                // update fav status
              },
            ),
          ),
          PageScrollBody(
            child: PagePadding(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(CONSTANT.BORDER_RADIUS)),
                child: Padding(
                  padding: const EdgeInsets.all(CONSTANT.SIZE_MD),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        widget.knowledgeData.title,
                        style: CONSTANT.TEXT_STYLE_HEADING_PRIMARY,
                      ),
                      SizedBox(
                        height: CONSTANT.SIZE_SM,
                      ),
                      widget.knowledgeData.attachUrl != null
                          ? Column(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        CONSTANT.BORDER_RADIUS),
                                    color: Colors.purple[50]),
                                width: width,
                                child: FittedBox(
                                    fit: BoxFit.contain, child: FlutterLogo()),
                              ),
                              SizedBox(
                                height: CONSTANT.SIZE_LG,
                              ),
                            ])
                          : Container(),
                      Text(
                        'เนื้อหา',
                        style: TextStyle(
                            fontSize: CONSTANT.FONT_SIZE_BODY,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget.knowledgeData.content,
                        style: CONSTANT.TEXT_STYLE_BODY,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// ListGroup(
//               title: 'คลังความรู้แนะนำ',
//               items: [],
//             ),
//             PagePadding(
//                 child: Column(
//               children: MOCK_KNOWLEDGE
//                   .map((item) => KnowledgeItem(
//                         knowledgeData: item,
//                       ))
//                   .toList(),
//             ))
