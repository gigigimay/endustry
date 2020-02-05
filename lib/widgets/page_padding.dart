import 'package:flutter/material.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class PagePadding extends StatelessWidget {
  const PagePadding(
      {Key key,
      this.child,
      this.top = CONSTANT.SIZE_MD,
      this.side = CONSTANT.SIZE_XL,
      this.left,
      this.right,
      this.bottom = 0.0})
      : super(key: key);
  final child, top, side, bottom, left, right;
  @override
  Widget build(BuildContext context) {
    double leftPad = left != null ? left : side;
    double rightPad = right != null ? right : side;
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPad, top, rightPad, bottom),
      child: child,
    );
  }
}
