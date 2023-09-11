part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<User> users;
  final RequestState usersState;
  final String usersErrorMessage;
  final List<ToDo> todos;
  final RequestState todosState;
  final String todosErrorMessage;

  const MainState({
    this.users = const [],
    this.usersState = RequestState.loading,
    this.usersErrorMessage = "",
    this.todos = const [],
    this.todosState = RequestState.loading,
    this.todosErrorMessage = "",
  });

  MainState copyWith({
    List<User>? users,
    RequestState? usersState,
    String? usersErrorMessage,
    List<ToDo>? todos,
    RequestState? todosState,
    String? todosErrorMessage,
  }) =>
      MainState(
        users: users ?? this.users,
        usersState: usersState ?? this.usersState,
        usersErrorMessage: usersErrorMessage ?? this.usersErrorMessage,
        todos: todos ?? this.todos,
        todosState: todosState ?? this.todosState,
        todosErrorMessage: todosErrorMessage ?? this.todosErrorMessage,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        users,
        usersState,
        usersErrorMessage,
        todos,
        todosState,
        todosErrorMessage,
      ];
}
