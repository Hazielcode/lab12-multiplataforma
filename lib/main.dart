import 'package:flutter/cupertino.dart';

import 'login.dart';

void main() {
  runApp(const BodegaFmasApp());
}

class BodegaFmasApp extends StatelessWidget {
  const BodegaFmasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'BodegaFMAS',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF007878),
        scaffoldBackgroundColor: Color(0xFFF0F0D8),
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Arial', color: Color(0xFF184848)),
        ),
      ),
      home: LoginPage(),
    );
  }
}
