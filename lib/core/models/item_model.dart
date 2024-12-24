class ItemModel{
  final int id;
  final String name;
  final num originalPrice;
  final num sellPrice;
   int quantity;
   //final String wareHouse;

  ItemModel({
    required this.name,
    required this.originalPrice,
    required this.sellPrice,
    required this.quantity,
    required this.id,
   // required this.wareHouse
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      originalPrice: json['originalPrice'],
      sellPrice: json['sellPrice'],
      quantity: json['quantity'],
      id: json['id'],
     // wareHouse: json['wareHouse']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'originalPrice': originalPrice,
      'sellPrice': sellPrice,
      'quantity': quantity,
    };
  }

}