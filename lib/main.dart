import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_delivery_admin/app/app.dart';
import 'package:quick_delivery_admin/core/binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await AppBinding().initializes();
  AppBinding().dependencies();
  runApp(const App());
}
