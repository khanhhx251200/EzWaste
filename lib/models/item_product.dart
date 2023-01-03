class Products {
  Products({
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

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["id"],
    active: json["active"],
    createDate: json["createDate"],
    updateDate: json["updateDate"],
    createBy: json["createBy"],
    updateBy: json["updateBy"],
    clientId: json["clientId"],
    url: json["url"],
    mass: double.parse(json["mass"].toString()),
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
