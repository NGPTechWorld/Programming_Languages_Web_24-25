import 'package:quick_delivery_admin/data/entities/product_order_entitie.dart';

class OrderModel {
  final int id;
  final List<ProductOrderEntite> products;
  final String date;
  final int statusId;
  final int totalCost;

  OrderModel({
    required this.id,
    required this.products,
    required this.date,
    required this.statusId,
    required this.totalCost,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      products: List<ProductOrderEntite>.from(
        json['products']
            .map((productJson) => ProductOrderEntite.fromJson(productJson)),
      ),
      date: json['date'],
      statusId: json['status_id'],
      totalCost: json['total_cost'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((product) => product.toJson()).toList(),
      'date': date,
      'status_id': statusId,
      'total_cost': totalCost,
    };
  }
}
