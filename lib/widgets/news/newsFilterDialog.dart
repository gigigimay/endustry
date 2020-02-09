import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NewsFilterDialog extends StatelessWidget {
  const NewsFilterDialog(
      {Key key, this.newsData, this.state, this.selectedFilter})
      : super(key: key);

  final state, selectedFilter;
  final List<News> newsData;

  @override
  Widget build(BuildContext context) {
    List<String> filterNameList = ['ข่าวทั้งหมด'] +
        MOCK_NEWSTYPES
            .where((item) => item.id != MOCK_NEWSTYPES.first.id)
            .toList()
            .map((item) => item.typeName)
            .toList();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
      ),
      backgroundColor: Colors.white,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: filterNameList.map((item) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    state.setState(() {
                      state.selectedFilter = item;
                      print(state.selectedFilter);
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: CONSTANT.SIZE_LG),
                      child: Text(
                        item,
                        style: item == selectedFilter
                            ? CONSTANT.TEXT_STYLE_HEADING_PRIMARY
                            : CONSTANT.TEXT_STYLE_HEADING,
                      ),
                    ),
                  ),
                ),
                item != MOCK_NEWSTYPES.last.typeName.toString()
                    ? Divider(
                        height: 0,
                      )
                    : Container()
              ],
            );
          }).toList()),
    );
  }
}
