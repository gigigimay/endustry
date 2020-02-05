import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class NewsFilterDialog extends StatelessWidget {
  const NewsFilterDialog(
      {Key key, this.newsData, this.state, this.selectedFilter})
      : super(key: key);

  final state, selectedFilter;
  final Map<String, dynamic> newsData;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: newsData.keys.map((item) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    state.setState(() {
                      state.selectedFilter = item;
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
                item != newsData.keys.last
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
