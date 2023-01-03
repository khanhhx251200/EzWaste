class User {
    String? userName;
   String? password;
   String? fullName;
   String? phone;
   String? email;
   String? birthday;
   String? address;
   int? point;
   int? sex;
   int? numberPerson;

  User({this.userName,
      this.password,
      this.fullName,
      this.phone,
      this.email,
      this.birthday,
      this.address,
      this.point,
      this.numberPerson,
      this.sex});

}

class TokenInfo {
  TokenInfo({
    this.accessToken,
    this.timeExprise,
  });

  String? accessToken;
  int? timeExprise;

  factory TokenInfo.fromJson(Map<String, dynamic> json) => TokenInfo(
    accessToken: json["accessToken"],
    timeExprise: json["timeExprise"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "timeExprise": timeExprise,
  };
}

class UserInfo {
  UserInfo({
    this.id,
    this.active,
    this.clientId,
    this.fullName,
    this.userName,
    this.passwordnew,
    this.birthday,
    this.email,
    this.gender,
    this.indentity,
    this.title,
    this.photo,
    this.signature,
    this.phoneCaProvider,
    this.employeeId,
    this.employeeCode,
    this.isSeller,
    this.roles,
    this.authorize,
    this.position,
    this.groupId,
    this.address,
    this.khoiluongShipper,
    this.moneySeller,
    this.massTaiChe,
    this.massSinhHoat,
  });

  int? id;
  bool? active;
  int? clientId;
  dynamic fullName;
  String? userName;
  dynamic passwordnew;
  dynamic birthday;
  dynamic email;
  dynamic gender;
  dynamic indentity;
  dynamic title;
  dynamic photo;
  dynamic signature;
  dynamic phoneCaProvider;
  dynamic employeeId;
  dynamic employeeCode;
  bool? isSeller;
  dynamic roles;
  dynamic authorize;
  dynamic position;
  dynamic groupId;
  String?address;
  double? moneySeller;
  double? khoiluongShipper;
  double? massTaiChe;
  double? massSinhHoat;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    active: json["active"],
    clientId: json["clientId"],
    fullName: json["fullName"],
    userName: json["userName"],
    passwordnew: json["passwordnew"],
    birthday: json["birthday"] ?? '',
    email: json["email"],
    gender: json["gender"],
    indentity: json["indentity"],
    title: json["title"],
    photo: json["photo"],
    signature: json["signature"],
    phoneCaProvider: json["phoneCAProvider"],
    employeeId: json["employeeId"],
    employeeCode: json["employeeCode"],
    isSeller: json["isSeller"],
    roles: json["roles"],
    authorize: json["authorize"],
    position: json["position"],
    groupId: json["groupId"],
    address: json["address"] != null ? json["address"] : '',
    moneySeller: json["moneySeller"],
    khoiluongShipper: json["khoiluongShipper"],
    massTaiChe: json["massTaiChe"],
    massSinhHoat: json["massSinhHoat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "clientId": clientId,
    "fullName": fullName,
    "userName": userName,
    "passwordnew": passwordnew,
    "birthday": birthday,
    "email": email,
    "gender": gender,
    "indentity": indentity,
    "title": title,
    "photo": photo,
    "signature": signature,
    "phoneCAProvider": phoneCaProvider,
    "employeeId": employeeId,
    "employeeCode": employeeCode,
    "isSeller": isSeller,
    "roles": roles,
    "authorize": authorize,
    "position": position,
    "groupId": groupId,
    "address": address,
  };
}

