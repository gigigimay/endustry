import 'dart:typed_data';

import 'package:endustry/export.dart';
import 'package:endustry/constants.dart' as CONSTANT;
import 'package:endustry/firebase.dart';
import 'package:endustry/pages/edit_profile/edit_keywords.dart';
import 'package:endustry/pages/edit_profile/edit_password.dart';
import 'package:endustry/storage.dart';
import 'package:endustry/widgets/menu/edit_profile_layout.dart';
import 'package:endustry/widgets/menu/profile_avatar.dart';
import 'package:endustry/widgets/menu/edit_button.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);
  final List<Keyword> keywordsData = MOCK_KEYWORDS;
  final List<UserType> userTypesData = MOCK_USERTYPES;

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  User _userData;
  bool _isValid = true, _isLoading = false;
  var _form = {};
  Uint8List _imgByteCode = kTransparentImage;

  @override
  void initState() {
    _userData = Storage.user;
    _form = {
      'firstName': _userData.firstName,
      'lastName': _userData.lastName,
      'email': _userData.email,
      'typeId': _userData.typeId,
    };

    super.initState();
  }

  void validateForm() {
    this.setState(() {
      _isValid = _formKey.currentState.validate();
    });
  }

  setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void submitForm() async {
    // TODO: check if the email is already used.
    setLoading(true);
    String newImgUrl = Storage.user.img;
    if (_imgByteCode != kTransparentImage) {
      await FirebaseDB()
          .updateImageToStorage(_imgByteCode, FirebaseDB.user.uid);
    }

    final User newUser = User.fromUser(
      _userData,
      email: _form['email'],
      firstName: _form['firstName'],
      lastName: _form['lastName'],
      typeId: _form['typeId'],
      img: newImgUrl,
    );

    FirebaseDB _firebaseDB = FirebaseDB();
    await _firebaseDB.login(
      Storage.user.email,
      Storage.user.password,
    );
    await _firebaseDB.editUserProfile(_userData, newUser);
    Storage.user = newUser;
    _userData = newUser;

    setLoading(false);
    Storage().generateInterest();
    Navigator.pop(context, true);
  }

  Function saveForm(key) => (value) {
        setState(() {
          _form[key] = value;
        });
      };

  openAwaitPage(Widget page) async => await Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => page));

  void onEditPasswordPressed() async {
    final bool success = await openAwaitPage(EditPasswordPage());
    if (success ?? false) Utils.showToast('เปลี่ยนรหัสผ่านแล้ว');
  }

  void onEditKeywordPressed() async {
    final bool success = await openAwaitPage(EditKeywordPage());
    if (success ?? false) {
      Utils.showToast('ตั้งค่าสิ่งที่สนใจแล้ว');
      setState(() {
        _userData = Storage.user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double avatarSize = width * 0.4;

    UserType userType = widget.userTypesData
        .firstWhere((UserType t) => t.id == _form['typeId']);

    List keywords = _userData.interestedTopics.map((String id) {
      Keyword keyword =
          widget.keywordsData.firstWhere((Keyword k) => k.id == id);
      return keyword?.name;
    }).toList();
    keywords.sort(); // TODO: kaizen the sort funtion

    return CustomLoadingOverlay(
      isLoading: _isLoading,
      child: UnfocusNode(
        child: EditProfileLayout(
          title: 'แก้ไขโปรไฟล์',
          topOverlap: avatarSize / 2,
          bottomOverlap: CONSTANT.FONT_SIZE_HEAD + CONSTANT.SIZE_XS,
          topWidget: ProfileAvatar(
            img: _imgByteCode == kTransparentImage
                ? NetworkImage(_userData.img)
                : MemoryImage(_imgByteCode),
            avatarSize: avatarSize,
            fabSize: avatarSize * 0.3,
            fabIcon: Icon(
              Icons.image,
              size: CONSTANT.SIZE_XL,
            ),
            fabAction: () async {
              var _oldImgByteCode = _imgByteCode;
              _imgByteCode = await Utils.getImageByGallery();
              setState(() {
                if (Utils.convertByteCodeToString(_imgByteCode) !=
                    Utils.convertByteCodeToString(kTransparentImage)) {
                  _imgByteCode = _imgByteCode;
                } else
                  _imgByteCode = _oldImgByteCode;
              });
            },
          ),
          bottomWidget: GradientButton(
            text: 'บันทึก',
            disabled: !_isValid,
            onPressed: submitForm,
          ),
          child: Form(
            key: _formKey,
            autovalidate: true,
            onChanged: validateForm,
            child: Column(
              children: <Widget>[
                PageScrollBody(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Input(
                        hintText: 'ชื่อ',
                        initialValue: _form['firstName'],
                        onChanged: saveForm('firstName'),
                        // TODO: implement keyboard action
                        textInputAction: TextInputAction.next,
                      ),
                      Input(
                        hintText: 'นามสกุล',
                        initialValue: _form['lastName'],
                        onChanged: saveForm('lastName'),
                        // TODO: implement keyboard action
                        textInputAction: TextInputAction.next,
                      ),
                      Input(
                        hintText: 'อีเมล',
                        initialValue: _form['email'],
                        onChanged: saveForm('email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: CONSTANT.REGEX.validateEmail,
                      ),
                      Input(
                          initialValue: '••••••••••',
                          readOnly: true,
                          obscureText: true,
                          suffixIcon: EditButton(
                            onTap: onEditPasswordPressed,
                            icon: Icons.edit,
                            text: 'เปลี่ยนรหัสผ่าน',
                          )),
                      SizedBox(height: CONSTANT.SIZE_LG),
                      Dropdown<UserType>(
                        title: 'คุณคือ',
                        initialValue: userType,
                        items: widget.userTypesData,
                        getLabel: (UserType item) => item.name,
                        onChanged: (UserType value) => setState(() {
                          _form['typeId'] = value.id;
                        }),
                      ),
                      SizedBox(height: CONSTANT.SIZE_LG),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'สิ่งที่คุณสนใจ',
                            style: CONSTANT.TEXT_STYLE_HEADING,
                          ),
                          EditButton(
                            onTap: onEditKeywordPressed,
                            icon: keywords.isEmpty ? Icons.add : Icons.edit,
                            text: keywords.isEmpty ? 'เพิ่ม' : 'แก้ไข',
                          )
                        ],
                      ),
                      keywords.isEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: CONSTANT.SIZE_MD),
                              child: Text(
                                'ยังไม่มีสิ่งที่สนใจ',
                                style:
                                    TextStyle(color: CONSTANT.COLOR_DISABLED),
                              ),
                            )
                          : Wrap(
                              spacing: CONSTANT.SIZE_XL,
                              runSpacing: 0.0,
                              children: keywords
                                  .map((word) => Chip(
                                        padding: EdgeInsets.all(0),
                                        label: Text(
                                          word,
                                          style: TextStyle(
                                              fontSize:
                                                  CONSTANT.FONT_SIZE_BODY),
                                        ),
                                        labelPadding: EdgeInsets.all(0),
                                        backgroundColor: Colors.white,
                                      ))
                                  .toList(),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
