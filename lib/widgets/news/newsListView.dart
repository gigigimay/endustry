import 'package:endustry/export.dart';
import 'package:endustry/widgets/news/hilightNewsItem.dart';
import '../../constants.dart' as CONSTANT;

class NewsListView extends StatelessWidget {
  const NewsListView({Key key, this.newsData}) : super(key: key);

  final List newsData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: newsData
          .map((item) => Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                        height: width * 0.25,
                        width: width * 0.2,
                        child: FittedBox(
                            fit: BoxFit.contain, child: FlutterLogo())),
                    Column(
                      children: <Widget>[Text('title')],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
