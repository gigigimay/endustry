import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import './list_item.dart';

class ListGroup extends StatelessWidget {
  const ListGroup({Key key, this.title, this.items, this.goto})
      : super(key: key);
  final String title;
  final Widget goto;
  final List items;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = width * 0.25;
    return Container(
      child: Column(
        children: <Widget>[
          PagePadding(
            right: CONSTANT.SIZE_MD,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  this.title,
                  style: CONSTANT.TEXT_STYLE_HEADING,
                )),
                IconButtonInk(
                    icon: Icons.arrow_forward,
                    onTap: () {
                      if (this.goto != null)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => this.goto),
                        );
                    })
              ],
            ),
          ),
          Container(
            height: itemWidth * 1.6,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: CONSTANT.SIZE_XL - CONSTANT.SIZE_SM),
              scrollDirection: Axis.horizontal,
              itemCount: this.items.length,
              itemBuilder: (BuildContext context, int index) {
                return items[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
