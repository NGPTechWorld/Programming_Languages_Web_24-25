class ProductOrderEntite {
  final String nameEn;
  final String nameAr;
  final int quantity;
  final int price;
  final int cost;

  ProductOrderEntite({
    required this.nameEn,
    required this.nameAr,
    required this.quantity,
    required this.price,
    required this.cost,
  });

  // Factory method to create a Product from JSON
  factory ProductOrderEntite.fromJson(Map<String, dynamic> json) {
    return ProductOrderEntite(
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      quantity: json['quantity'],
      price: json['price'],
      cost: json['cost'],
    );
  }

  // Method to convert a Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'name_en': nameEn,
      'name_ar': nameAr,
      'quantity': quantity,
      'price': price,
      'cost': cost,
    };
  }
}
