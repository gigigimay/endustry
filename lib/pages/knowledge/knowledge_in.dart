import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class KnowledgeInPage extends StatefulWidget {
  KnowledgeInPage({
    Key key,
    @required this.knowledgeData,
  }) : super(key: key);

  final Knowledge knowledgeData;

  @override
  _KnowledgeInPageState createState() => _KnowledgeInPageState();
}

class _KnowledgeInPageState extends State<KnowledgeInPage> {
  @override
  void initState() {
    // _fav = widget.favStatus;
    super.initState();
    // TODO: change to get data from real user
    _fav = MOCK_USER.favKnowledges.contains(widget.knowledgeData.id);
  }

  bool _fav;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BgLayout(
      navbar: NavigationBar(currentTab: 'knowledge'),
      child: Column(
        children: <Widget>[
          PageAppBar(
            title: 'คลังความรู้',
            hasBackArrow: true,
            actionWidget: IconButtonInk(
              icon: Icon(
                _fav ? Icons.star : Icons.star_border,
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
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                  RoundedBox(
                                    height: height * 0.24,
                                    color: Colors.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          CONSTANT.BORDER_RADIUS),
                                      child: FadeInImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            widget.knowledgeData.attachUrl),
                                        placeholder: AssetImage(
                                            'assets/images/know_white.png'),
                                      ),
                                    ),
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
