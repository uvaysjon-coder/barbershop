import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInit();
  runApp(const App());
}



