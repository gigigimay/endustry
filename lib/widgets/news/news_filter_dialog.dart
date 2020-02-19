import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NewsFilterDialog extends StatelessWidget {
  const NewsFilterDialog(
      {Key key, this.newsData, this.selectedFilter, this.onPressed})
      : super(key: key);

  final selectedFilter;
  final List<News> newsData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final newsType = MOCK_NEWSTYPES;

    List _filterName = newsType
        .where((item) => item.id != MOCK_NEWSTYPES.first.id)
        .map((item) => item.typeName)
        .toList();
    _filterName.sort((a, b) => a.compareTo(b));

    List<String> filterNameList = ['ข่าวทั้งหมด'] + _filterName;

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
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      onPressed(item);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: CONSTANT.SIZE_LG),
                        child: Center(
                          child: Text(
                            item,
                            style: item == selectedFilter
                                ? CONSTANT.TEXT_STYLE_HEADING_PRIMARY
                                : CONSTANT.TEXT_STYLE_HEADING,
                          ),
                        ),
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
