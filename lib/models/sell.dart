
class Sell {
  late final bool typeAddress;
  late final bool typeOrder;
  String address;
  String time;
  String? timeShow;

  Sell(this.typeAddress, this.typeOrder, this.address, this.time, {this.timeShow});

  Map<String, dynamic> toJson() => {
    "name": 'Name',
    "type": typeOrder ? 1 : 2,
    "time": time,
  };
}
