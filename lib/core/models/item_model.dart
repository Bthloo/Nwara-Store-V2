class ItemModel{
  final int id;
  final String name;
  final num originalPrice;
  final num sellPrice;
   int quantity;
  ItemModel({
    required this.name,
    required this.originalPrice,
    required this.sellPrice,
    required this.quantity,
    required this.id,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      originalPrice: json['originalPrice'],
      sellPrice: json['sellPrice'],
      quantity: json['quantity'],
      id: json['id'],
    );
  }
}