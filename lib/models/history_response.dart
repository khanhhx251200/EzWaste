// To parse this JSON data, do
//
//     final historyResponse = historyResponseFromJson(jsonString);

import 'dart:convert';

HistoryResponse historyResponseFromJson(String str) =>
    HistoryResponse.fromJson(json.decode(str));

String historyResponseToJson(HistoryResponse data) =>
    json.encode(data.toJson());

class HistoryResponse {
  HistoryResponse({
    required this.resultCode,
    required this.message,
    required this.responseTime,
    required this.data,
  });

  int resultCode;
  String message;
  int responseTime;
  List<Order> data;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      HistoryResponse(
        resultCode: json["resultCode"],
        message: json["message"],
        responseTime: json["responseTime"],
        data: List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCode": resultCode,
        "message": message,
        "responseTime": responseTime,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.id,
    required this.idCreate,
    required this.type,
    required this.time,
    required this.createDate,
    required this.updateDate,
    required this.address,
    required this.status,
    required this.listItem,
    required this.userCreate,
    required this.userCreateType,
    required this.userShipper,
    required this.userCreateFullName,
    required this.userShipperFullName,
    required this.mass,
    required this.money,
    this.numberRating,
  });

  int? id;
  int idCreate;
  int type;
  int time;
  int createDate;
  int updateDate;
  String address;
  int status;
  List<ListItem> listItem;
  String userCreate;
  String userCreateType;
  String userShipper;
  String userCreateFullName;
  String userShipperFullName;
  double mass;
  double money;
  double? numberRating;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"] ?? -1,
    idCreate: json["idCreate"] ?? -1,
    type: json["type"],
    time: json["time"] ?? -1,
    createDate: json["createDate"] ?? -1,
    updateDate: json["updateDate"] ?? -1,
    address: json["address"] != null ? json['address'] : '',
    userCreateType: json["userCreateType"] != null ? json['userCreateType'] : '',
    status: json["status"],
    listItem: json["listItem"] != null
        ? List<ListItem>.from(
        json["listItem"].map((x) => ListItem.fromJson(x)))
        : [],
    userCreate: json["userCreate"],
    userShipper: json["userShipper"],
    userCreateFullName: json["userCreateFullName"],
    userShipperFullName: json["userShipperFullName"],
    mass: json["mass"] != null ? json["mass"] : 0,
    money: json["money"] != null ? json["money"] : 0,
    numberRating: json["numberRating"] != null ? json["numberRating"] : 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "time": time,
    "address": address,
    "status": status,
    "listItem": listItem.isEmpty
        ? null
        : List<ListItem>.from(listItem.map((x) => x.toJson())),
    "userCreate": userCreate,
    "userShipper": userShipper,
  };
}

class ListItem {
  ListItem({
    required this.id,
    required this.active,
    required this.createDate,
    required this.updateDate,
    required this.createBy,
    required this.updateBy,
    required this.clientId,
    required this.idOrders,
    required this.idItems,
    required this.idItemsModel,
    required this.khoiluong,
  });

  int id;
  bool active;
  int createDate;
  int updateDate;
  int createBy;
  int updateBy;
  int clientId;
  int idOrders;
  int idItems;
  IdItemsModel idItemsModel;
  double khoiluong;

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        id: json["id"],
        active: json["active"],
        createDate: json["createDate"],
        updateDate: json["updateDate"],
        createBy: json["createBy"],
        updateBy: json["updateBy"],
        clientId: json["clientId"],
        idOrders: json["idOrders"],
        idItems: json["idItems"],
        idItemsModel: IdItemsModel.fromJson(json["idItemsModel"]),
        khoiluong: json["khoiluong"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "createDate": createDate,
        "updateDate": updateDate,
        "createBy": createBy,
        "updateBy": updateBy,
        "clientId": clientId,
        "idOrders": idOrders,
        "idItems": idItems,
        "idItemsModel": idItemsModel.toJson(),
        "khoiluong": khoiluong,
      };
}

class IdItemsModel {
  IdItemsModel({
    required this.id,
    required this.active,
    required this.createDate,
    required this.updateDate,
    required this.createBy,
    required this.updateBy,
    required this.clientId,
    required this.url,
    required this.mass,
    required this.money,
    required this.name,
  });

  int id;
  bool active;
  int createDate;
  int updateDate;
  int createBy;
  int updateBy;
  int clientId;
  String url;
  double mass;
  double money;
  String name;

  factory IdItemsModel.fromJson(Map<String, dynamic> json) => IdItemsModel(
        id: json["id"],
        active: json["active"],
        createDate: json["createDate"],
        updateDate: json["updateDate"],
        createBy: json["createBy"],
        updateBy: json["updateBy"],
        clientId: json["clientId"],
        url: json["url"] == null ? "assets/images/open_box.png" : json["url"],
        mass: json["mass"],
        money: json["money"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "createDate": createDate,
        "updateDate": updateDate,
        "createBy": createBy,
        "updateBy": updateBy,
        "clientId": clientId,
        "url": url,
        "mass": mass,
        "money": money,
        "name": name,
      };
}

class UserCreateBy {
  int id;
  bool active;
  String fullName;
  String userName;

  UserCreateBy(this.id, this.active, this.fullName, this.userName);

  factory UserCreateBy.fromJson(Map<String, dynamic> json) => UserCreateBy(
        json["id"],
        json["active"],
        json["fullName"]! - null ? json['fullName'] : '',
        json["userName"]! - null ? json['userName'] : '',
      );
}

class UserShipper {
  int id;
  bool active;
  String fullName;
  String userName;

  UserShipper(this.id, this.active, this.fullName, this.userName);

  factory UserShipper.fromJson(Map<String, dynamic> json) => UserShipper(
        json["id"],
        json["active"],
        json["fullName"]! - null ? json['fullName'] : '',
        json["userName"]! - null ? json['userName'] : '',
      );
}
