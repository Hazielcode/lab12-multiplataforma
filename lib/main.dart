import 'package:flutter/cupertino.dart';

import 'login.dart';

void main() {
  runApp(const RetroStoreApp());
}

class RetroStoreApp extends StatelessWidget {
  const RetroStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'RetroStore',
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFFFF00FF),
        scaffoldBackgroundColor: Color(0xFF1A1A2E),
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Courier', color: Color(0xFF00FF41)),
        ),
      ),
      home: LoginPage(),
    );
  }
}
