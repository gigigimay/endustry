import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/knowledge/knowledge_in.dart';
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/knowledge/knowledge_item.dart';
import 'package:endustry/widgets/service/recent_service_group.dart';
import 'package:endustry/widgets/service/suggested_service_group.dart';
import '../widgets/home/searchbar.dart';
import '../widgets/home/content_group.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Service> recentServicesData = MOCK_SERVICES;
  final List<Service> suggestedServicesData = Storage.suggestServices;
  final List<Knowledge> suggestedKnowledgesData = Storage.suggestKnowledges;
  final User userData = MOCK_USER;

  final String currentTab = 'home';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BgLayout(
      safeTop: false,
      navbar: NavigationBar(currentTab: currentTab),
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
                          RecentServiceGroup(
                            recentServicesData: recentServicesData,
                            currentTab: currentTab,
                          ),
                          SuggestedServiceGroup(
                            suggestedServicesData: suggestedServicesData,
                            currentTab: currentTab,
                          ),
                          ContentGroup(
                            title: 'คลังความรู้แนะนำ',
                            spacing: 0,
                            runSpacing: 0,
                            onSeeAll: () {
                              Utils.navigatePush(context, KnowledgePage());
                            },
                            children: suggestedKnowledgesData
                                .sublist(0, 3)
                                .map((Knowledge item) => KnowledgeItem(
                                      knowledgeData: item,
                                      itemOnPressed: () => Utils.navigatePush(
                                          context,
                                          KnowledgeInPage(
                                            knowledgeData: item,
                                            currentTab: currentTab,
                                          )),
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
