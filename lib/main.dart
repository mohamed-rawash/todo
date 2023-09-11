import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/services_locator.dart';
import 'package:todo_app/core/themes/colors.dart';
import 'package:todo_app/domain/usecases/get_todos_usecase.dart';
import 'package:todo_app/domain/usecases/get_users_usecase.dart';
import 'package:todo_app/presentation/controller/main_bloc.dart';
import 'package:todo_app/presentation/screens/splash_screen.dart';
import 'package:todo_app/presentation/screens/users_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
            titleTextStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ),
            elevation: 8,
            shadowColor: AppColors.darkPurpleColor,
          )),
      home: const SplashScreen(),
    );
  }
}
