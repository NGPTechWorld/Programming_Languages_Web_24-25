class MarketCardEntite {
  final int id;
  final String nameEn;
  final String nameAr;
  final String manager_name;
  final String? image;
  final int manager_id;
  final String? market_name_en;
  final String? market_name_ar;

  MarketCardEntite({
    required this.id,
    required this.manager_id,
    required this.nameEn,
    required this.nameAr,
    required this.manager_name,
    this.image, // Nullable
    this.market_name_en,
    this.market_name_ar,
  });

  factory MarketCardEntite.fromJson(Map<String, dynamic> json) {
    return MarketCardEntite(
      id: json['id'],
      manager_id: json['manager_id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      image: json['image'], // قد يكون null
      manager_name: json['manager_name'],
      market_name_en: json['market_name_en'],
      market_name_ar: json['market_name_ar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'manager_id': manager_id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'manager_name': manager_name,
      'image': image,
      'market_name_en': market_name_en,
      'market_name_ar': market_name_ar,
    };
  }
}
