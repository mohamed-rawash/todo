import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/presentation/screens/users_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 4),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UsersScreen()),),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/json/animation.json'),
      ),
    );
  }
}
