class NotificationModel {
  int idOrder;
  int idSaller;
  int idShipper;
  int createDate;
  String userSaller;
  String userShipper;
  String content;
  String address;

  NotificationModel(this.idOrder, this.idSaller, this.idShipper, this.createDate,
      this.userSaller, this.userShipper, this.content, this.address);

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    json["idOrder"],
    json["idSaller"],
    json["idShipper"],
    json["createDate"],
    json["userSaller"],
    json["userShipper"],
    json["content"],
    json["address"],
  );

  Map<String, dynamic> toJson() => {
    "idOrder": idOrder,
    "idSaller": idSaller,
    "idShipper": idShipper,
    "createDate": createDate,
    "userSaller": userSaller,
    "userShipper": userShipper,
    "content": content,
    "address": address,
  };

}
