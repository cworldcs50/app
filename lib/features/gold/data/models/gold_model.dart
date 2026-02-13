class GoldModel {
  const GoldModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.dateTime,
    required this.updatedAtReadable,
  });

  factory GoldModel.fromJson(Map<String, dynamic> json) => GoldModel(
    name: json["name"],
    symbol: json["symbol"],
    price: (json["price"] as num).toDouble(),
    dateTime: DateTime.parse(json["updatedAt"]),
    updatedAtReadable: json["updatedAtReadable"],
  );

  final double price;
  final DateTime dateTime;
  final String name, symbol, updatedAtReadable;
}
