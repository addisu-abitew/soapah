import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soapah/presentation/pages/calculator/calculator_page.dart';

import 'presentation/core/theme/app_theme.dart';
import 'presentation/core/utils/size_utils.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: CalculatorPage(),
        );
      },
    );
  }
}
