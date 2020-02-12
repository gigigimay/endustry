import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledge_in.dart';
import 'package:endustry/widgets/home/list_item.dart';
import '../widgets/home/searchbar.dart';
import '../widgets/home/content_group.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  final List<Service> recentServicesData = MOCK_SERVICES;
  final List<Service> suggestedServicesData = MOCK_SERVICES;
  final List<Knowledge> suggestedKnowledgesData = MOCK_KNOWLEDGES;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = (width / 2) - (CONSTANT.SIZE_XL + CONSTANT.SIZE_MD);

    final User userData = MOCK_USER;

    return BgLayout(
      safeTop: false,
      navbar: NavigationBar(currentpage: 'home'),
      child: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: width * 0.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/appbg_head.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            child: SafeArea(
              bottom: false,
              child: PagePadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleText('กระทรวง', color: Colors.white),
                    TitleText(
                      'อุตสาหกรรม',
                      fontSize: CONSTANT.FONT_SIZE_TITLE * 1.5,
                      color: Colors.white,
                      height: 0.8,
                    ),
                    SizedBox(height: CONSTANT.SIZE_XX + width * 0.1),
                    SearchBar(),
                    const SizedBox(height: CONSTANT.SIZE_MD),
                    PageScrollBody(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: CONSTANT.SIZE_MD),
                          ContentGroup(
                            title: 'การใช้งานล่าสุด',
                            // TODO: add onSeeAll
                            children: recentServicesData.reversed
                                .toList()
                                .sublist(0, 4)
                                .map((Service service) => ListItem(
                                      label: service.name,
                                      itemWidth: itemWidth,
                                      imageHeight: itemWidth * 2 / 3,
                                      padding: EdgeInsets.all(0),
                                      // TODO: add onPressed
                                    ))
                                .toList(),
                          ),
                          ContentGroup(
                            title: 'บริการแนะนำสำหรับคุณ',
                            // TODO: add onSeeAll
                            children: suggestedServicesData
                                .sublist(0, 4)
                                .map((Service service) => ListItem(
                                      label: service.name,
                                      itemWidth: itemWidth,
                                      imageHeight: itemWidth * 2 / 3,
                                      padding: EdgeInsets.all(0),
                                      // TODO: add onPressed
                                    ))
                                .toList(),
                          ),
                          ContentGroup(
                            title: 'คลังความรู้แนะนำสำหรับคุณ',
                            onSeeAll: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KnowledgePage()),
                              );
                            },
                            children: suggestedKnowledgesData
                                .sublist(0, 4)
                                .map((Knowledge item) => ListItem(
                                      label: item.title,
                                      itemWidth: itemWidth,
                                      imageHeight: itemWidth * 2 / 3,
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                KnowledgeInPage(
                                              knowledgeData: item,
                                            ),
                                          ),
                                        );
                                      },
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: CONSTANT.SIZE_XL)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
