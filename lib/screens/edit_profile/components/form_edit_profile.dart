import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/screens/edit_profile/provider/edit_profile_provider.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/size_config.dart';

class FormEditProfile extends StatefulWidget {
  const FormEditProfile({Key? key, required this.provider}) : super(key: key);
  final EditProfileProvider provider;

  @override
  _FormEditProfileState createState() => _FormEditProfileState();
}

class _FormEditProfileState extends State<FormEditProfile> {
  final editFullNameController = TextEditingController();
  final editBirthdayController = TextEditingController();
  final editPhoneController = TextEditingController();
  final editAddressController = TextEditingController();
  final editEmailController = TextEditingController();
  final editNumberPeopleController = TextEditingController();

  UserInfo? _user;

  List<String> itemPeoples = [];

  String peoplesCurrent = '';

  @override
  void initState() {
    super.initState();
    initView();
  }

  initView() async {
    await createListPeople();
    _user = widget.provider.userInfo;
    if (_user != null) {
      addDataToField(_user!);
    }
  }

  createListPeople() {
    itemPeoples.add('Đào Xuân Long (Chủ hộ)');
    itemPeoples.add('Nguyễn Công Bách');
    itemPeoples.add('Dương Ngọc Huyền');
    itemPeoples.add('Nguyễn Văn Thuẫn');
    peoplesCurrent = itemPeoples[0];
  }

  addDataToField(UserInfo user) {
    editFullNameController.text = user.fullName;
    editBirthdayController.text =
        user.birthday != null || user.birthday != '' ? user.birthday : '';
    // editPhoneController.text = user.phone!;
    // editAddressController.text = user.address!;
    // editEmailController.text = user.email!;
  }

  User getUserFromField() {
    String fullName = editFullNameController.text;
    String birthday = editBirthdayController.text;
    String phone = editPhoneController.text;
    String address = editAddressController.text;
    int numberPerson = editNumberPeopleController.text.trim().isNotEmpty
        ? int.parse(editNumberPeopleController.text)
        : 0;
    User user = new User(
        fullName: fullName,
        birthday: birthday,
        phone: phone,
        address: address,
        numberPerson: numberPerson);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(size14),
      child: Column(
        children: [
          // inputFullName(editFullNameController),
          // SizedBox(height: getProportionateScreenHeight(24)),
          // numberPeopleInFamily(editNumberPeopleController),
          SizedBox(height: getProportionateScreenHeight(24)),
          listAddress(),
        ],
      ),
    );
  }

  InputDecoration inputFieldDecoration(
      TextEditingController controller, String hintText, bool isValid) {
    return InputDecoration(
      isDense: true,
      contentPadding:
          EdgeInsets.only(top: size8, bottom: size8),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      errorStyle: TextStyle(color: kErrorSecondColor),
      suffix: SvgPicture.asset(
        controller.text.isEmpty
            ? 'assets/icons/Close.svg'
            : 'assets/icons/Check mark rounde.svg',
        color: controller.text.isEmpty ? kErrorSecondColor : kPrimaryColor,
        width: size16,
        height: size16,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: controller.text.isEmpty
                ? kErrorSecondColor
                : kPrimaryColor),
      ),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kErrorSecondColor)),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kErrorSecondColor),
      ),
    );
  }

  Column inputFullName(TextEditingController controller) {
    bool _isValid = controller.text.isNotEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Họ và tên', style: TextStyle(fontSize: size16)),
        TextFormField(
          enabled: false,
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.always,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Họ tên không được để trống!';
            }
            return null;
          },
          onChanged: (value) {
            widget.provider.setIsEditUser(true);
            setState(() {
              _isValid = value.isNotEmpty;
            });
          },
          style:
              TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          decoration: inputFieldDecoration(
              controller, 'Nhập họ và tên của bạn', _isValid),
        ),
      ],
    );
  }

  Future<void> showDatePicker(TextEditingController controller) async {
    FocusScope.of(context).unfocus();
    await DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(DateTime.now().year - 100, 1, 1),
        maxTime: DateTime.now(),
        onChanged: (date) {}, onConfirm: (date) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(date);
      });
    }, currentTime: getInitTime(controller), locale: LocaleType.vi);
  }

  DateTime getInitTime(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return DateTime.now();
    } else {
      return convertStringToDateTime(controller.text);
    }
  }

  Row numberPeopleInFamily(TextEditingController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Nhân khẩu: ', style: TextStyle(fontSize: size16)),
        SizedBox(width: size8),
        Expanded(
          child: DropdownButton(

            menuMaxHeight: 300,
            value: peoplesCurrent,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            selectedItemBuilder: (context) {
              return itemPeoples.map<Widget>((String item) {
                return DropdownMenuItem(
                  enabled: false,
                  value: item,
                  child: Text(item,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor)),
                );
              }).toList();
            },
            items: itemPeoples.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: null,
          ),
        ),
      ],
    );
  }

  Column listAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Địa chỉ: ', style: TextStyle(fontSize: size16)),
        Container(
          margin: EdgeInsets.only(top: size8),
          child: ListTile(
            minLeadingWidth: 0,
            leading: SvgPicture.asset('assets/icons/Location point.svg',
                alignment: Alignment.center, color: kBlackColor),
            title: Padding(
              padding: const EdgeInsets.all(size8),
              child: Text('Nhà riêng',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            subtitle: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: size8),
              child: Text(
                  context.read<HomeProvider>().userInfo!.address!),
            ),
          ),
        )
      ],
    );
  }

  MaterialButton buttonCreateAddress() {
    return MaterialButton(
      color: kPrimaryColor,
      elevation: size8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      onPressed: () {},
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/Plus Icon.svg', color: kWhiteColor),
          SizedBox(width: size8),
          Text('Thêm địa chỉ mới', style: TextStyle(color: kWhiteColor)),
        ],
      ),
    );
  }
}
