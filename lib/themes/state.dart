import 'package:final_project/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/themes/fontsize_logic.dart';
import 'package:final_project/themes/language_logic.dart';
import 'package:final_project/themes/mode_logic.dart';
import 'package:provider/provider.dart';

Widget providerStateApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FontSizeLogic()),
      ChangeNotifierProvider(create: (context) => ThemeLogic()),
      ChangeNotifierProvider(create: (context) => LanguageLogic()),
    ],
    child: StateApp(),
  );
}

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;
    double size = context.watch<FontSizeLogic>().size;

    return MaterialApp(
      home: HomeScreen(),
      themeMode: themeIndex == 0 ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 20 + size),
          headlineMedium:
              TextStyle(fontSize: 22 + size, fontStyle: FontStyle.italic),
          headlineLarge:
              TextStyle(fontSize: 22 + size, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 17 + size, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 18 + size, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 19 + size, color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[800],
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 20 + size, color: Colors.white),
          headlineMedium: TextStyle(
              fontSize: 22 + size,
              fontStyle: FontStyle.italic,
              color: Colors.white),
          headlineLarge: TextStyle(
              fontSize: 22 + size,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          bodySmall: TextStyle(fontSize: 17 + size, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 18 + size, color: Colors.white70),
          bodyLarge: TextStyle(fontSize: 19 + size, color: Colors.white70),
        ),
      ),
    );
  }
}
