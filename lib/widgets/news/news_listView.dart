import 'package:endustry/export.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key key, this.newsData}) : super(key: key);

  final List newsData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
