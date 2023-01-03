class Leaderboard{
  late final String imageUrl;
  late final String fullName;
  late final double topRank;
  late final int total;

  Leaderboard({required this.imageUrl, required this.fullName, required this.topRank, required this.total});

  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
    imageUrl: json["imageUrl"] != null ? json["imageUrl"] : null,
    fullName: json["fullName"],
    topRank: json["topRank"],
    total: json["totalMoney"],
  );
}