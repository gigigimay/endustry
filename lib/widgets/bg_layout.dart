import 'package:flutter/material.dart';

class BgLayout extends StatelessWidget {
  BgLayout({Key key, this.child, this.bgImg = 'assets/images/appbg.png'})
      : super(key: key);
  final child, bgImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(this.bgImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: this.child,
        ),
      ],
    ));
  }
}
