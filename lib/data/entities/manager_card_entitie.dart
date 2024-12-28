
class ManagerCardEntitie {
  final int id;
  final String name;

  ManagerCardEntitie({
    required this.id,
    required this.name,
  });

  factory ManagerCardEntitie.fromJson(Map<String, dynamic> json) {
    return ManagerCardEntitie(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
