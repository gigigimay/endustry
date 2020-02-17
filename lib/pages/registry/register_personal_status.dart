import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/widgets/registry/register_status_btn.dart';

class RegisterPage3 extends StatefulWidget {
  RegisterPage3({Key key, this.onpressed}) : super(key: key);
  final Function onpressed;
  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  var _selectIndex;

  @override
  void initState() {
    super.initState();
    _selectIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RegisterStatusBtn(
          imgUrl: 'assets/images/entrepreneur.png',
          text: 'ผู้ประกอบการ',
          isSelected: _selectIndex == 0,
          onTap: () {
            setState(() {
              _selectIndex = 0;
              widget.onpressed(true);
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
              widget.onpressed(true);
            });
          },
        )
      ],
    );
  }
}
