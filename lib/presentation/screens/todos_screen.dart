import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:todo_app/presentation/controller/main_bloc.dart';

import '../../core/services/services_locator.dart';
import '../../core/themes/colors.dart';
import '../../domain/entities/todo_entities.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.userId, required this.userName});

  final int userId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainBloc>()
        ..add(GetUsersEvent())
        ..add(GetTodosEvent()),
  child: Scaffold(
      appBar: AppBar(
        title: Text('$userName Todos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) => previous.todosState != current.todosState,
        builder: (context, state) {
          List<ToDo> todos = List<ToDo>.from(
              state.todos.where((element) => element.userId == userId));
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => Card(
              margin: const EdgeInsets.all(8),
              elevation: 8,
              shadowColor: AppColors.darkPurpleColor,
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/avatar.jpg",
                          fit: BoxFit.cover,
                          width: 150,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  todos[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  todos[index].completed ? Container(
                    height: 40,
                    width: 100,
                    padding: const EdgeInsets.all(3),
                    color: Colors.deepOrange,
                    child: const Center(child: Text("completed", style: TextStyle(color: Colors.white, fontSize: 16,),),),
                  ) : Container(),
                ],
              ),
            ),
          );
        },
      ),
    ),
);
  }
}
