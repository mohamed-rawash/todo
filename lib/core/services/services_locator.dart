
import 'package:get_it/get_it.dart';
import 'package:todo_app/data/data_source/remote_data_source.dart';
import 'package:todo_app/data/repository/todo_repository.dart';
import 'package:todo_app/domain/repository/base_todo%20_repository.dart';
import 'package:todo_app/domain/usecases/get_todos_usecase.dart';
import 'package:todo_app/domain/usecases/get_users_usecase.dart';
import 'package:todo_app/presentation/controller/main_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {

  void init() {

    ///Bloc
    sl.registerFactory(() => MainBloc(sl(), sl()));

    ///use cases
    sl.registerLazySingleton(() => GetUsersUseCase(sl()));
    sl.registerLazySingleton(() => GetToDosUseCase(sl()));

    ///repositories
    sl.registerLazySingleton<BaseToDoRepository>(() => ToDoRepository(sl()));

    ///data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

  }

}