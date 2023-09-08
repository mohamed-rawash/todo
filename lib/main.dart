import 'package:flutter/material.dart';
import 'package:todo_app/core/services/services_locator.dart';
import 'package:todo_app/domain/usecases/get_todos_usecase.dart';
import 'package:todo_app/domain/usecases/get_users_usecase.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

Future<void> test() async {
  GetUsersUseCase(sl()).call();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }
}
