class ResponseModel {
  ResponseModel({
    required this.totalPage,
    required this.totalRecord,
    required this.objList,
  });

  int totalPage;
  int totalRecord;
  List<dynamic>? objList;

  factory ResponseModel.fromJson(dynamic json) => ResponseModel(
      totalPage: json['totalPage'],
      totalRecord: json['totalRecord'],
      objList: json['objList']);
}
