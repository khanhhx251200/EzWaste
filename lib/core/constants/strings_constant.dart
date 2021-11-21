import 'package:intl/intl.dart';

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Vui lòng nhập mật khẩu";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Mật khẩu không đúng";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Vui lòng nhập số điện thoại";
const String kAddressNullError = "Please Enter your address";
const String kRequired = "không được để trống";
const String kPhone = "Số điện thoại";
const String kPassword = "Mật khẩu";
const String kSignIn = "Đăng nhập";
const String kSignUp = "Đăng ký";
const String kRegisterAccount = "Đăng ký tài khoản";
const String kProfile = "Trang cá nhân";
const String kMyAccount = "Tài khoản của tôi";
const String kNotifications = "Thông báo";
const String kSettings = "Cài đặt";
const String kHelpCenter = "Trung tâm hỗ trợ";
const String kLogOut = "Đăng xuất";
const String kStart = "Bắt đầu";

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

convertIntToCurrency(int currency){
  return NumberFormat.currency(locale: "vi").format(currency);
}