import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;

class LogoutConfirmDialog extends StatelessWidget {
  const LogoutConfirmDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Text getText(String text, bool primary) => Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: width * 0.05,
            color: primary ? Colors.white : CONSTANT.COLOR_PRIMARY,
            fontWeight: FontWeight.w700,
          ),
        );
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CONSTANT.BORDER_RADIUS),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: CONSTANT.SIZE_XX, horizontal: CONSTANT.SIZE_MD),
              child: Column(
                children: <Widget>[
                  Text(
                    'ต้องการออกจากระบบหรือไม่?',
                    style: CONSTANT.TEXT_STYLE_HEADING,
                  ),
                  SizedBox(height: CONSTANT.SIZE_XL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: CONSTANT.SIZE_MD),
                          child: CustomOutlineButton(
                            onPressed: () => Navigator.pop(context),
                            child: getText('ยกเลิก', false),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: CONSTANT.SIZE_SM),
                          child: GradientButton(
                            padding: EdgeInsets.symmetric(
                              vertical: CONSTANT.SIZE_SM,
                              horizontal: CONSTANT.SIZE_MD,
                            ),
                            child: getText('ออกจากระบบ', true),
                            onPressed: () => Navigator.pop(context, true),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
