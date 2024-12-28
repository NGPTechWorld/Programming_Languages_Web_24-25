class ProductsCardEntite {
  final int id;
  final int? marketId;
  final String nameEn;
  final String nameAr;
  final int quantity;
  final double price;
  final String? image;
  final String descriptionEn;
  final String descriptionAr;
  final int numberOfPurchases;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String categoryEn;
  final String categoryAr;
  final String? market_name_en;
  final String? market_name_ar;

  ProductsCardEntite({
    required this.id,
    this.marketId,
    required this.nameEn,
    required this.nameAr,
    required this.quantity,
    required this.price,
    this.image, // Nullable
    required this.descriptionEn,
    required this.descriptionAr,
    required this.numberOfPurchases,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryEn,
    required this.categoryAr,
    this.market_name_en,
    this.market_name_ar,
  });

  factory ProductsCardEntite.fromJson(Map<String, dynamic> json) {
    return ProductsCardEntite(
      id: json['id'],
      marketId: json['market_id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      image: json['image'], // قد يكون null
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      numberOfPurchases: json['number_of_purchases'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      categoryEn: json['category_en'],
      categoryAr: json['category_ar'],
      market_name_en: json['market_name_en'],
      market_name_ar: json['market_name_ar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'market_id': marketId,
      'name_en': nameEn,
      'name_ar': nameAr,
      'quantity': quantity,
      'price': price,
      'image': image,
      'description_en': descriptionEn,
      'description_ar': descriptionAr,
      'number_of_purchases': numberOfPurchases,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'category_en': categoryEn,
      'category_ar': categoryAr,
      'market_name_en': market_name_en,
      'market_name_ar': market_name_ar,
    };
  }
}
