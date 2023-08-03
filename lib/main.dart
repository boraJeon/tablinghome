import 'package:flutter/material.dart';

import 'auth_setting/marketing_agreement_screen.dart';
import 'home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    MarketingAgreementScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[900],
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home_filled,
              ),
            ),
            BottomNavigationBarItem(
              label: "", // Label 옵션이 옵셔널인데 왜 이걸 안넣으면 죽지?
              icon: Icon(
                Icons.settings,
              ),
            ),
          ],
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
