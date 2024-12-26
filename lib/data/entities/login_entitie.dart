import 'package:quick_delivery_admin/app/services/api/end_points.dart';

class LoginEntitie {
  final String message;
  final String? bearerToken;
  LoginEntitie({required this.message, this.bearerToken});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.message: message,
      ApiKey.bearerToken: bearerToken,
    };
  }

  factory LoginEntitie.fromMap(Map<String, dynamic> map) {
    return LoginEntitie(
      message: map[ApiKey.message] as String,
      bearerToken: map[ApiKey.bearerToken] as String?,
    );
  }
}
