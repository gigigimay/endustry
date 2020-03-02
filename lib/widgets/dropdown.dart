import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class Dropdown<T> extends StatefulWidget {
  const Dropdown({
    Key key,
    @required this.title,
    @required this.items,
    this.initialValue,
    @required this.getLabel,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final T initialValue;
  final List<T> items;
  final Function getLabel, onChanged;

  @override
  _DropdownState createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<Dropdown> {
  T _value;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.title,
          style: CONSTANT.TEXT_STYLE_HEADING,
        ),
        SizedBox(width: CONSTANT.SIZE_LG),
        Container(
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: CONSTANT.COLOR_PRIMARY,
          ),
          child: DropdownButton<T>(
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: 'CloudSoft',
            ),
            value: _value,
            elevation: 1,
            icon: Padding(
                padding: EdgeInsets.all(CONSTANT.SIZE_SM),
                child: Icon(Icons.expand_more,
                    size: width * 0.08, color: Colors.white)),
            underline: Container(),
            onChanged: (T newValue) {
              setState(() {
                _value = newValue;
              });
              if (widget.onChanged != null) widget.onChanged(newValue);
            },
            selectedItemBuilder: (BuildContext context) => widget.items
                .map<Widget>((item) => Padding(
                      padding: const EdgeInsets.only(left: CONSTANT.SIZE_XL),
                      child: Center(child: Text(widget.getLabel(item))),
                    ))
                .toList(),
            items: widget.items
                .map((value) => DropdownMenuItem<T>(
                      value: value,
                      child: Container(
                          child: Text(
                        widget.getLabel(value),
                        style: TextStyle(
                          color: CONSTANT.COLOR_PRIMARY,
                        ),
                      )),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
