import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/pages/registry/register_layout.dart';
import 'package:endustry/widgets/registry/register_status_btn.dart';

class RegisterPage3 extends StatefulWidget {
  RegisterPage3(
      {Key key, this.initData, this.nextBtnFuntion, this.prevBtnFuntion})
      : super(key: key);
  final Function prevBtnFuntion, nextBtnFuntion;
  final initData;
  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  var _selectIndex;
  bool _valid;

  setValid(bool boolean) {
    _valid = boolean;
  }

  @override
  void initState() {
    super.initState();
    _selectIndex = MOCK_USERTYPES
        .indexWhere((item) => item.id == widget.initData['typeId']);
    _valid = [0, 1].contains(_selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    return RegisterLayout(
      registerStep: 2,
      stateTitle: 'คุณคือ...?',
      prevBtnFuntion: widget.prevBtnFuntion,
      nextBtnFuntion: () =>
          widget.nextBtnFuntion(MOCK_USERTYPES[_selectIndex].id),
      nextText: 'ต่อไป',
      disabled: !_valid,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RegisterStatusBtn(
            imgUrl: 'assets/images/entrepreneur.png',
            text: 'ผู้ประกอบการ',
            isSelected: _selectIndex == 0,
            onTap: () {
              setState(() {
                _selectIndex = 0;
                setValid(true);
              });
            },
          ),
          SizedBox(
            height: CONSTANT.SIZE_XX,
          ),
          RegisterStatusBtn(
            imgUrl: 'assets/images/people.png',
            text: 'บุคคลทั่วไป',
            isSelected: _selectIndex == 1,
            onTap: () {
              setState(() {
                _selectIndex = 1;
                setValid(true);
              });
            },
          )
        ],
      ),
    );
  }
}
