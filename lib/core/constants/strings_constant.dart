import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/time_sell.dart';

const String kAppName = "EZ Waste";
const String kServerError = "Lỗi hệ thống";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Vui lòng nhập mật khẩu";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Mật khẩu không đúng";
const String kNamelNullError = "Vui lòng nhập họ và tên";
const String kPhoneNumberNullError = "Vui lòng nhập số điện thoại";
const String kAddressNullError = "Please Enter your address";
const String kRequired = "không được để trống";
const String kPhone = "Số điện thoại";
const String kPassword = "Mật khẩu";
const String kSignIn = "Đăng nhập";
const String kSignUp = "Đăng ký";
const String kRegisterAccount = "Đăng ký tài khoản";
const String kProfile = "Xem thông tin cá nhân";
const String kMyAccount = "Tài khoản của tôi";
const String kNotifications = "Thông báo";
const String kSettings = "Cài đặt";
const String kHelpCenter = "Trung tâm hỗ trợ";
const String kForgotPassword = "Quên mật khẩu";
const String kOrLoginBy = "Hoặc đăng nhập bằng";
const String kLoginByFaceID = "Đăng nhập bằng gương mặt";
const String kLoginByFingerPrint = "Đăng nhập bằng vân tay";
const String kLoginByAnotherAccount = "Đăng nhập tài khoản khác";
const String kAreYouSureWantToCloseThisFeature = "Bạn có chắc chắn muốn đóng tính năng này?";
const String kLogOut = "Đăng xuất";
const String kHello = "Xin chào";
const String kStart = "Bắt đầu";
const String kHome = "Trang chủ";
const String kHistory = "Lịch sử";
const String kMe = "Tôi";
const String kMenu = "Menu";
const String kSeeMore = "Xem thêm";
const String kCollapse = "Thu gọn";
const String kMember = "Member";
const String kSave = "Lưu";
const String kUpdate = "Cập nhật";
const String kRewardPoints = "Điểm thưởng";
const String kTotalWeight = "Tổng số cân đã bán";
const String kSurplus = "Số dư";
const String kISell = "Tôi bán";
const String kBooking = "Đặt lịch";
const String kWallet = "Ví";
const String kChangePassword = "Thay đổi mật khẩu";
const String kNewDesign = "Trải nghiệm giao diện mới";
const String kDelete = "Xóa";
const String kLeaderboard = "Bảng xếp hạng";
const String kCreateOrder = "Tạo đơn thu gom";
const String kFollow = "Theo dõi";
const String kChart = "Thống kê";
const String kCharts = "Thi đua";
const String kCopy = "Sao chép";
const String kConfirm = "Xác nhận";
const String kRate = "Đánh giá";
const String kCancel = "Đóng";
const String kAgree = "Đồng ý";
const String kNo = "Không";
const String kTOP = "TOP";
const String kBOTTOM = "BOTTOM";
const String kMyCompanyAddress = "Xuân Mai, Hà Nội";
const String kAddress = "Địa chỉ";
const String kContentLogin = "Cùng chung tay phân loại rác tại nhà để tối ưu hóa nguồn tài nguyên rác thải cộng đồng";
const String kBookingPlastic = "Đặt lịch thu gom rác tái chế";
const String kChooseTimeBooking = "Chọn khoảng thời gian thu gom";
const String kTimeBooking = "Thời gian thu gom";
const String kPresentTime = "Thời gian hiện tại";
const String kBackToHome = "Quay về màn hình chính";
const String kFullName = "Họ và tên";
const String kSex = "Giới tính";
const String kFeedback = "Phản hồi";
const String kRefuse = "Từ chối";
const String kComplete = "Hoàn thành";
const String kSendInformation = "Gửi thông tin";
const String kConfirmRecycle = "Xác nhận thu gom rác";
const String kTitleReasonRefuse = "Cho chúng tôi biết lý do bạn từ chối thông tin thu gom";
const String kTitleQuestionContentment = "Bạn có hài lòng về tài xế thu gom rác không?";
const String kTitleQuestionConfirm = "Bạn có đồng ý với thông tin thu gom rác không?";
const String kThanksForFeedback = "Cảm ơn bạn đã phản hồi về quá trình thu gom rác";
const String kPersonalStatistics = "Thống kê cá nhân";
const String kQuantityTaken = "Số lượng rác đã bán";
const String kFilter = "Bộ lọc";
const String kFilterTime = "Bộ lọc thời gian";
const String kApply = "Áp dụng";
const String kMyChart = "Thống kê cá nhân";
const String kLatestBooking = "Lịch thu gom gần nhất";
const String kNews = "Tin tức";
const String kNotCollect = "Chưa thu gom";
const String kWaitConfirm= "Chờ xác nhận";
const String kCompleted = "Đã hoàn thành";
const String kClassifyRecycle = "Phân loại rác";
const String kStatus = "Trạng thái";
const String kSortBy = "Sắp xếp theo";
const String kNotReceived = "Chưa nhận đơn";
const String kDoAndWaitConfirm= "Đã thu gom - Chờ xác nhận";
const String kDetail= "Chi tiết";
const String kFollowBooking = "Theo dõi lịch thu gom";
const String kAmountReceived = "Số tiền thu gom rác nhận được";
const String kInfoShipper = "Thông tin tài xế thu gom";
const String kInfoBooking = "Thông tin lịch thu gom";
const String kCollect = "Thu gom";
const String kNearestCollectTime = "Thời gian thu gom gần nhất";
const String kFurthestCollectTime = "Thời gian thu gom xa nhất";

//Filter Booking
const int FILTER_ORGANIC = 1;
const int FILTER_PLASTIC = 2;
const int FILTER_NOT_COLLECT = 2;
const int FILTER_WAIT_CONFIRM = 3;
const int FILTER_COMPLETE = 4;
const int FILTER_REFUSE = 5;
const String SORT_BY_NEAR = 'NEAR';
const String SORT_BY_FAR = 'FAR';

const String KEY_TOKEN = "KEY_TOKEN";
const String PLASTIC = "PLASTIC";
const String ORGANIC = "ORGANIC";

const String kOrganicRecycle = "Rác sinh hoạt";
const String kPlasticRecycle = "Rác tái chế";

const String YEAR = "YEAR";
const String MONTH = "MONTH";
const String DAY = "DAY";

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

convertIntToCurrency(int currency) {
  return NumberFormat.currency(locale: "vi").format(currency);
}

String convertTimeStampToStringDetail(int timeStamp) {
  final df = new DateFormat('kk:mm - dd/MM/yyyy');
  var date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
  return df.format(date).toString();
}

String convertTimeStampToString(int timeStamp) {
  final df = new DateFormat('dd/MM/yyyy');
  var date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
  return df.format(date).toString();
}

String convertDateToString(DateTime? dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime!);
}


String convertDateToNameOfDay(DateTime dateTime) {
  String nameOfDay = DateFormat('EEEE').format(dateTime);
  if(nameOfDay.toLowerCase() == "monday"){
    return "Thứ 2";
  }else if(nameOfDay.toLowerCase() == "tuesday"){
    return "Thứ 3";
  }else if(nameOfDay.toLowerCase() == "wednesday"){
    return "Thứ 4";
  }else if(nameOfDay.toLowerCase() == "thursday"){
    return "Thứ 5";
  }else if(nameOfDay.toLowerCase() == "friday"){
    return "Thứ 6";
  }else if(nameOfDay.toLowerCase() == "saturday"){
    return "Thứ 7";
  }else if(nameOfDay.toLowerCase() == "sunday"){
    return "Chủ nhật";
  }
  return nameOfDay;
}

DateTime convertStringToDateTime(String time) {
  return DateFormat('dd/MM/yyyy').parse(time);
}

String statusString(int status) {
  if (status == 1) {
    return kNotReceived;
  } else if (status == 2) {
    return kNotCollect;
  } else if (status == 3) {
    return kDoAndWaitConfirm;
  } else if (status == 4) {
    return kCompleted;
  } else {
    return kRefuse;
  }
}

IconData statusIcon(int status) {
  if (status == 1) {
    return Icons.error;
  } else if (status == 2 || status == 3) {
    return Icons.timelapse;
  } else if (status == 4) {
    return Icons.check_circle;
  } else {
    return Icons.cancel;
  }
}
