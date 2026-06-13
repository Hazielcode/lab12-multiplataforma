import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'home.dart';
import 'shared_styles.dart';

class LoadingLoginPage extends StatefulWidget {
  const LoadingLoginPage({super.key});

  @override
  State<LoadingLoginPage> createState() => _LoadingLoginPageState();
}

class _LoadingLoginPageState extends State<LoadingLoginPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: AppColors.loadingBackground,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.shopping_cart,
              color: AppColors.neonGreen,
              size: 64,
            ),
            SizedBox(height: 24),
            CupertinoActivityIndicator(radius: 18, color: AppColors.secondary),
            SizedBox(height: 24),
            Text(
              'Iniciando sesion...',
              style: TextStyle(
                color: AppColors.surface,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
