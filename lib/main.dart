import 'package:bloc_tutorial/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openLazyBox('appBox');
  runApp(const App());
}


