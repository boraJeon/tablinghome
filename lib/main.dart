import 'package:flutter/material.dart';

import 'auth_setting/marketing_agreement_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MarketingAgreementScreen(),
      ),
    );
  }
}
