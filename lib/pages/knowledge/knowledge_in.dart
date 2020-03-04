import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/knowledge/fav_button.dart';

class KnowledgeInPage extends StatefulWidget {
  KnowledgeInPage({
    Key key,
    @required this.knowledgeData,
    this.currentTab = 'knowledge',
  }) : super(key: key);

  final Knowledge knowledgeData;
  final String currentTab;

  @override
  _KnowledgeInPageState createState() => _KnowledgeInPageState();
}

class _KnowledgeInPageState extends State<KnowledgeInPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BgLayout(
      navbar: NavigationBar(currentTab: widget.currentTab),
      child: Column(
        children: <Widget>[
          PageAppBar(
              title: 'คลังความรู้',
              hasBackArrow: true,
              actionWidget: FavButton(
                knwId: widget.knowledgeData.id,
              )),
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
                        widget.knowledgeData.content ?? '',
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
