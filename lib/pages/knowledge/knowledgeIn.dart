import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class KnowledgeInPage extends StatefulWidget {
  KnowledgeInPage({Key key, this.knowledgeData, this.favStatus})
      : super(key: key);

  final Knowledge knowledgeData;
  final bool favStatus;

  @override
  _KnowledgeInPageState createState() => _KnowledgeInPageState();
}

class _KnowledgeInPageState extends State<KnowledgeInPage> {
  @override
  void initState() {
    _fav = widget.favStatus;
    super.initState();
  }

  bool _fav;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              onPressed: () {
                setState(() {
                  _fav = !_fav;
                });
                // TODO: update fav status
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
