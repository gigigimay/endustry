import 'package:endustry/export.dart';

class BgLayout extends StatelessWidget {
  BgLayout({
    Key key,
    this.child,
    this.bgImg = 'assets/images/appbg.png',
    this.navbar,
    this.safeTop = true,
    this.safeBottom = true,
  }) : super(key: key);
  final String bgImg;
  final Widget navbar, child;
  final bool safeTop, safeBottom;

  @override
  Widget build(BuildContext context) {
    Widget pageBody =
        SafeArea(top: safeTop, bottom: safeBottom, child: this.child);
    Widget pagechild = this.navbar != null
        ? Stack(children: <Widget>[
            pageBody,
            this.navbar,
          ])
        : pageBody;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        image: DecorationImage(
          image: AssetImage(this.bgImg),
          fit: BoxFit.cover,
        ),
      ),
      child: pagechild,
    ));
  }
}
