part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetUsersEvent extends MainEvent {
}
class GetTodosEvent extends MainEvent {}
