import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import './list_item.dart';

class ListGroup extends StatelessWidget {
  const ListGroup({Key key, this.title, this.items}) : super(key: key);
  final title;
  final List<Service> items;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = width * 0.25;
    return Container(
      child: Column(
        children: <Widget>[
          PagePadding(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  this.title,
                  style: CONSTANT.TEXT_STYLE_HEADING,
                )),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () => print('pressed: ${this.title}'),
                    child: Padding(
                      padding: const EdgeInsets.all(CONSTANT.SIZE_XS),
                      child: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: CONSTANT.SIZE_XS),
          Container(
            height: itemWidth + 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: CONSTANT.SIZE_XL - CONSTANT.SIZE_SM),
              scrollDirection: Axis.horizontal,
              itemCount: this.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Item(
                    itemWidth: itemWidth, label: this.items[index].name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
