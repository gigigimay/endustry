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
      this.nextText = 'ต่อไป',
      this.nextBtnFuntion,
      this.backText = 'ย้อนกลับ',
      this.prevBtnFuntion,
      this.disabled=false})
      : super(key: key);

  final Widget child;
  final registerStep, stateTitle;
  final String stateSubTitle, backText, nextText;
  final Function() nextBtnFuntion, prevBtnFuntion;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                        SizedBox(
                          width: CONSTANT.SIZE_LG,
                        ),
                        Transform.translate(
                          offset: Offset(0, 10),
                          child: Column(
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
                    child,
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
