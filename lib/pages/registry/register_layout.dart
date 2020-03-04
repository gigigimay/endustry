import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/registry/register_btn_group.dart';

class RegisterLayout extends StatelessWidget {
  const RegisterLayout({
    Key key,
    @required this.child,
    @required this.registerStep,
    @required this.stateTitle,
    this.stateSubTitle = '',
    this.nextText = 'ต่อไป',
    this.nextBtnFuntion,
    this.backText = 'ย้อนกลับ',
    this.prevBtnFuntion,
    this.disabled = false,
    this.scroll = true,
  }) : super(key: key);

  final Widget child;
  final registerStep, stateTitle;
  final String stateSubTitle, backText, nextText;
  final Function() nextBtnFuntion, prevBtnFuntion;
  final bool disabled, scroll;

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: UnfocusNode(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleText('สมัครสมาชิก'),
                    SizedBox(height: CONSTANT.SIZE_LG + CONSTANT.SIZE_XS),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                CONSTANT.COLOR_PRIMARY,
                              ),
                              strokeWidth: 5,
                              value: (registerStep + 1) * 0.25,
                              backgroundColor: CONSTANT.COLOR_DISABLED,
                            ),
                            Container(
                              width: 2.5,
                              height: 45,
                              color: CONSTANT.COLOR_BACKGROUND,
                            ),
                            Container(
                              width: 45,
                              height: 2.5,
                              color: CONSTANT.COLOR_BACKGROUND,
                            )
                          ],
                        ),
                        SizedBox(width: CONSTANT.SIZE_LG),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 6),
                              Text(
                                stateTitle,
                                style: CONSTANT.TEXT_STYLE_HEADING,
                              ),
                              Text(
                                stateSubTitle ?? '',
                                style: CONSTANT.TEXT_STYLE_BODY,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: CONSTANT.SIZE_LG + CONSTANT.SIZE_XS),
                    scroll
                        ? Expanded(child: SingleChildScrollView(child: child))
                        : child,
                  ],
                ),
              ),
            ),
          ),
          RegisterBtnGroup(
            disabled: disabled,
            nextText: nextText,
            nextBtnFuntion: nextBtnFuntion,
            backText: backText,
            prevBtnFuntion: prevBtnFuntion,
          ),
        ],
      ),
    );
  }
}
