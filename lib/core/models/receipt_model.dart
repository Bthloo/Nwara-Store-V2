

import 'package:nwara_strore_sql/core/models/item_model.dart';

class ReceiptModel{

  final String name;
  final List<ItemModel> items;
  final num originalPrice;
  final num sellPrice;
  final num netIncome;
  ReceiptModel({required this.name,
    required this.items,
    required this.originalPrice,
    required this.sellPrice,
    required this.netIncome});

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    return ReceiptModel(
      name: json['name'],
      items: List<ItemModel>.from(json['items'].map((x) => ItemModel.fromJson(x))),
      originalPrice: json['originalPrice'],
      sellPrice: json['sellPrice'],
      netIncome: json['netIncome']
    );
  }
}