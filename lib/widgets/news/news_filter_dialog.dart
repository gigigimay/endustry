import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NewsFilterDialog extends StatelessWidget {
  const NewsFilterDialog(
      {Key key, this.newsData, this.state, this.selectedFilter, this.onPressed})
      : super(key: key);

  final state, selectedFilter;
  final List<News> newsData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    List _filterName = MOCK_NEWSTYPES
        .where((item) => item.id != MOCK_NEWSTYPES.first.id)
        .toList()
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
                      onPressed(item);
                      Navigator.pop(context);
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
