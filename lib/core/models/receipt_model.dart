

import 'package:nwara_strore_sql/core/models/item_model.dart';

// class ReceiptModel{
//
//   final String name;
//   final List<ItemModel>? items;
//   final num originalPrice;
//   final num sellPrice;
//   final num netIncome;
//   ReceiptModel({required this.name,
//     required this.items,
//     required this.originalPrice,
//     required this.sellPrice,
//     required this.netIncome});
//
//   factory ReceiptModel.fromJson(Map<String, dynamic> json) {
//     return ReceiptModel(
//       name: json['name'],
//       items: List<ItemModel>.from(json['items'].map((x) => ItemModel.fromJson(x))),
//       originalPrice: json['originalPrice'],
//       sellPrice: json['sellPrice'],
//       netIncome: json['netIncome']
//     );
//   }
// }

class ReceiptModel {
  final String name;
  final List<ItemModel> items; // Non-nullable list
  final num originalPrice;
  final num sellPrice;
  final num netIncome;

  ReceiptModel({
    required this.name,
    required this.items, // Ensure non-nullable
    required this.originalPrice,
    required this.sellPrice,
    required this.netIncome,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    // If 'items' is missing or null, use an empty list
    var itemsJson = json['items'];
    List<ItemModel> items = itemsJson != null
        ? List<ItemModel>.from(itemsJson.map((x) => ItemModel.fromJson(x)))
        : [];

    return ReceiptModel(
      name: json['name'] ?? '', // Handle potential missing fields
      items: items,
      originalPrice: json['originalPrice'] ?? 0.0,
      sellPrice: json['sellPrice'] ?? 0.0,
      netIncome: json['netIncome'] ?? 0.0,
    );
  }
}