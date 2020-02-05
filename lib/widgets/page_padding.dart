import 'package:flutter/material.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class PagePadding extends StatelessWidget {
  const PagePadding(
      {Key key,
      this.child,
      this.top = CONSTANT.SIZE_MD,
      this.side = CONSTANT.SIZE_XL,
      this.bottom = 0.0})
      : super(key: key);
  final child, top, side, bottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(this.side, this.top, this.side, this.bottom),
      child: this.child,
    );
  }
}
