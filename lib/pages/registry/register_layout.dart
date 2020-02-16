import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/registry/register_btn_group.dart';

class RegisterLayout extends StatelessWidget {
  const RegisterLayout(
      {Key key,
      @required this.child,
      @required this.registerStep,
      @required this.stateTitle,
      this.stateSubTitle = '',
      this.nextBtnFuntion,
      this.prevBtnFuntion})
      : super(key: key);

  final Widget child;
  final registerStep, stateTitle;
  final String stateSubTitle;
  final Function() nextBtnFuntion, prevBtnFuntion;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText('สมัครสมาชิก'),
            SizedBox(
              height: CONSTANT.SIZE_LG + CONSTANT.SIZE_XS,
            ),
            Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      value: (registerStep + 1) * 0.25,
                      backgroundColor: CONSTANT.COLOR_DISABLED,
                    ),
                    Container(
                      width: 5,
                      height: 45,
                      color: CONSTANT.COLOR_BACKGROUND,
                    ),
                    Container(
                      width: 45,
                      height: 5,
                      color: CONSTANT.COLOR_BACKGROUND,
                    )
                  ],
                ),
                SizedBox(
                  width: CONSTANT.SIZE_LG,
                ),
                Transform.translate(
                  offset: Offset(0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        stateTitle,
                        style: CONSTANT.TEXT_STYLE_HEADING,
                      ),
                      Visibility(
                        maintainState: true,
                        maintainAnimation: true,
                        maintainSize: true,
                        visible: stateSubTitle.isNotEmpty,
                        child: Text(
                          stateSubTitle,
                          style: CONSTANT.TEXT_STYLE_BODY,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: CONSTANT.SIZE_LG + CONSTANT.SIZE_XS,
            ),
            SingleChildScrollView(child: child),
          ],
        ),
        RegisterBtnGroup(
          nextBtnFuntion: nextBtnFuntion,
          prevBtnFuntion: prevBtnFuntion,
        )
      ],
    );
  }
}
