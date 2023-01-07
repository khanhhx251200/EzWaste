class Statistic {
  Statistic({
    required this.sumMassSh,
    required this.sumMoneySh,
    required this.sumMassTc,
    required this.sumMoneyTc,
  });

  Statistic.fromJson(dynamic json) {
    sumMassSh = json['sumMassSh'];
    sumMoneySh = json['sumMoneySh'];
    sumMassTc = json['sumMassTc'];
    sumMoneyTc = json['sumMoneyTc'];
  }

  double sumMassSh = 0;
  double sumMoneySh = 0;
  double sumMassTc = 0;
  double sumMoneyTc = 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sumMassSh'] = sumMassSh;
    map['sumMoneySh'] = sumMoneySh;
    map['sumMassTc'] = sumMassTc;
    map['sumMoneyTc'] = sumMoneyTc;
    return map;
  }
}
