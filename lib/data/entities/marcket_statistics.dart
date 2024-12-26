class MarcketStatistics {
  final String message;
  final int numberOfProducts;
  final int numberOfOrders;
  final int salary;

  MarcketStatistics({
    required this.message,
    required this.numberOfProducts,
    required this.numberOfOrders,
    required this.salary,
  });

  // Factory method to create a Statistics object from JSON
  factory MarcketStatistics.fromJson(Map<String, dynamic> json) {
    return MarcketStatistics(
      message: json['message'],
      numberOfProducts: json['number_of_products'],
      numberOfOrders: json['number_of_orders'],
      salary: json['salary'],
    );
  }

  // Method to convert a Statistics object to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'number_of_products': numberOfProducts,
      'number_of_orders': numberOfOrders,
      'salary': salary,
    };
  }
}
