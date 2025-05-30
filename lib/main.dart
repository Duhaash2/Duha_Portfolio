import 'dart:ui';
import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/theme_provider.dart';
import 'providers/app_data_provider.dart';
import 'screens/main_screen.dart';
import 'utils/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Make sure Flutter bindings are initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AppDataProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Duha Abu Shanab - Portfolio',
            theme: themeProvider.currentThemeData,
            debugShowCheckedModeBanner: false,
            home: const MainScreen(),
            scrollBehavior: _CustomScrollBehavior(), // Enables touch + mouse scroll
          );
        },
      ),
    );
  }
}

// ✅ Enables scroll using touch, mouse, and trackpad — important for Web/Desktop
class _CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
