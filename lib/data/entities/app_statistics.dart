class AppStatistics {
  final String message;
  final int numberOfProducts;
  final int numberOfOrders;
  final int numberOfMarkets;

  AppStatistics({
    required this.message,
    required this.numberOfProducts,
    required this.numberOfOrders,
    required this.numberOfMarkets,
  });

  // Factory method to create a Statistics object from JSON
  factory AppStatistics.fromJson(Map<String, dynamic> json) {
    return AppStatistics(
      message: json['message'],
      numberOfProducts: json['number_of_products'],
      numberOfOrders: json['number_of_orders'],
      numberOfMarkets: json['number_of_markets'],
    );
  }

  // Method to convert a Statistics object to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'number_of_products': numberOfProducts,
      'number_of_orders': numberOfOrders,
      'number_of_markets': numberOfMarkets,
    };
  }
}
