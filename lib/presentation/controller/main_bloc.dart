import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/utils/enums.dart';
import 'package:todo_app/domain/entities/todo_entities.dart';
import 'package:todo_app/domain/usecases/get_users_usecase.dart';

import '../../domain/entities/user_entities.dart';
import '../../domain/usecases/get_todos_usecase.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  GetUsersUseCase getUsersUseCase;
  GetToDosUseCase getToDosUseCase;

  MainBloc(this.getUsersUseCase, this.getToDosUseCase)
      : super(const MainState()) {
    on<GetUsersEvent>(_getUsers);
    on<GetTodosEvent>(_getTodos);
  }

  Future<FutureOr<void>> _getUsers(GetUsersEvent event, Emitter<MainState> emit) async {
    final result = await getUsersUseCase.call();
    result.fold(
          (left) => emit(
        state.copyWith(
            usersState: RequestState.error,
            usersErrorMessage: left.errorMessage
        ),
      ),
          (right) => emit(
          state.copyWith(
            users: right,
            usersState: RequestState.loaded,
          )
      ),
    );
  }

  Future<FutureOr<void>> _getTodos(GetTodosEvent event, Emitter<MainState> emit) async {
    final result = await getToDosUseCase.call();
    result.fold(
          (left) => emit(
        state.copyWith(
            todosState: RequestState.error,
            todosErrorMessage: left.errorMessage
        ),
      ),
          (right) => emit(
          state.copyWith(
            todos: right,
            todosState: RequestState.loaded
          )
      ),
    );
  }
}
