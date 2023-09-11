import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:todo_app/core/themes/colors.dart';
import 'package:todo_app/domain/entities/user_entities.dart';
import 'package:todo_app/presentation/components/user_component.dart';
import 'package:todo_app/presentation/controller/main_bloc.dart';
import 'package:todo_app/presentation/screens/todos_screen.dart';

import '../../core/services/services_locator.dart';
import '../../core/utils/enums.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainBloc>()
        ..add(GetUsersEvent())
        ..add(GetTodosEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
        ),
        body: BlocBuilder<MainBloc, MainState>(
          builder: (BuildContext context, MainState state) {
            return switch (state.todosState) {
              RequestState.loading => Center(
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballClipRotatePulse,

                    /// Required, The loading type of the widget
                    colors: [AppColors.backgroundColor],

                    /// Optional, The color collections
                    strokeWidth: 2,

                    /// Optional, The stroke of the line, only applicable to widget which contains line
                    backgroundColor: AppColors.backgroundColor,

                    /// Optional, Background of the widget
                    pathBackgroundColor: AppColors.backgroundColor,

                    /// Optional, the stroke backgroundColor
                  ),
                ),
              RequestState.loaded => ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) => InkWell(
                    child: UserComponent(
                      user: state.users[index],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodosScreen(
                                userId: state.users[index].id,
                                userName: state.users[index].name)),
                      );
                    },
                  ),
                ),
              RequestState.error => Text(state.usersErrorMessage),
            };
          },
        ),
      ),
    );
  }
}
