import 'package:final_project/pages/developer_screen.dart';
import 'package:final_project/pages/home_screen.dart';
import 'package:final_project/pages/list_screen.dart';
import 'package:final_project/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:final_project/themes/fontsize_logic.dart';
import 'package:final_project/themes/language_logic.dart';
import 'package:final_project/themes/mode_logic.dart';
import 'package:provider/provider.dart';

Widget providerStateApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: FontSizeLogic()),
      ChangeNotifierProvider.value(value: ThemeLogic()),
      ChangeNotifierProvider.value(value: LanguageLogic()),
    ],
    child: StateApp(),
  );
}

class StateApp extends StatefulWidget {
  const StateApp({super.key});

  @override
  State<StateApp> createState() => _StateAppState();
}

class _StateAppState extends State<StateApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;
    double size = context.watch<FontSizeLogic>().size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeIndex == 0 ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.purple[50],
        brightness: Brightness.light,
        textTheme: TextTheme(
          labelSmall: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 6 + size),
          labelMedium: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 8 + size),
          labelLarge: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 10 + size),
          headlineSmall: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 18 + size),
          headlineMedium: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 20 + size),
          headlineLarge: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 22 + size),
          bodySmall: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w300,
              fontSize: 12 + size,
              color: Colors.black),
          bodyMedium: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 14 + size,
              color: Colors.black),
          bodyLarge: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 16 + size,
              color: Colors.black),
          displayLarge: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 18 + size,
              color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.purple[100],
        ),
        expansionTileTheme: ExpansionTileThemeData(
          textColor: Colors.black,
          iconColor: Colors.purple[400],
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.purple[400],
          textColor: Colors.black,
          titleTextStyle: const TextStyle(fontSize: 16),
        ),
        iconTheme: IconThemeData(
          color: Colors.purple[400],
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        textTheme: TextTheme(
          labelSmall: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 6 + size,
              color: Colors.black),
          labelMedium: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 8 + size,
              color: Colors.black),
          labelLarge: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 10 + size,
              color: Colors.black),
          headlineSmall: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 18 + size,
              color: Colors.black),
          headlineMedium: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 20 + size,
              color: Colors.black),
          headlineLarge: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 22 + size,
              color: Colors.black),
          bodySmall: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w300,
              fontSize: 12 + size,
              color: Colors.black),
          bodyMedium: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 14 + size,
              color: Colors.black),
          bodyLarge: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 16 + size,
              color: Colors.black),
          displayLarge: TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 18 + size,
              color: Colors.white),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.black,
        ),
        expansionTileTheme: ExpansionTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.purple[200],
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.purple[200],
          textColor: Colors.white,
          titleTextStyle: const TextStyle(fontSize: 16),
        ),
        iconTheme: IconThemeData(
          color: Colors.purple[400],
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
        ),
      ),
      home: Scaffold(
        body: _selectedIndex == 0
            ? const HomeScreen()
            : _selectedIndex == 1
                ? ListScreen()
                : DeveloperScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(Icons.list_alt)
                  : const Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outlined),
              label: 'Developer',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
