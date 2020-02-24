import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/service/service_in.dart';
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/home/list_item.dart';
import 'package:endustry/widgets/knowledge.dart/knowledge_item.dart';
import '../widgets/home/searchbar.dart';
import '../widgets/home/content_group.dart';

class HomeFeedPage extends StatelessWidget {
  //TODO: TRY TO REMOVE CONST
  // const
  HomeFeedPage({Key key, this.changePage}) : super(key: key);

  final List<Service> recentServicesData = Storage.services;
  final List<Service> suggestedServicesData =
      Storage.services.reversed.toList();
  final List<Knowledge> suggestedKnowledgesData = Storage.knowledges;

  final Function changePage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = (width / 2) - (CONSTANT.SIZE_XL + CONSTANT.SIZE_MD);

    final User userData = MOCK_USER;

    return Stack(
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
                                    imageUrl: service.image,
                                    padding: EdgeInsets.all(0),
                                    onPressed: () => Utils.navigatePush(
                                      context,
                                      ServiceInPage(serviceData: service),
                                    ),
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
                                    imageUrl: service.image,
                                    padding: EdgeInsets.all(0),
                                    onPressed: () => Utils.navigatePush(
                                      context,
                                      ServiceInPage(serviceData: service),
                                    ),
                                  ))
                              .toList(),
                        ),
                        ContentGroup(
                          title: 'คลังความรู้แนะนำสำหรับคุณ',
                          spacing: 0,
                          runSpacing: 0,
                          onSeeAll: () {
                            Utils.navigatePush(context, KnowledgePage());
                          },
                          children: suggestedKnowledgesData
                              .sublist(0, 3)
                              .map((Knowledge item) => KnowledgeItem(
                                    favStatus: userData.favKnowledges
                                        .contains(item.id),
                                    knowledgeData: item,
                                    // TODO: fix it
                                    // itemOnPressed: ,
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
    );
  }
}
