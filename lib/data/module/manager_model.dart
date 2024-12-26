// ignore_for_file: public_member_api_docs, sort_constructors_first
class ManagerModel {
  final int id;
  final String name;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  ManagerModel({
    required this.id,
    required this.name,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ManagerModel.fromJson(Map<String, dynamic> json) {
    return ManagerModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
