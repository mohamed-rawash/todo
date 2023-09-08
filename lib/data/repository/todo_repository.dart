import 'package:either_dart/src/either.dart';
import 'package:todo_app/core/error/exceptions.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/data/data_source/remote_data_source.dart';
import 'package:todo_app/domain/entities/todo_entities.dart';
import 'package:todo_app/domain/entities/user_entities.dart';
import 'package:todo_app/domain/repository/base_todo%20_repository.dart';

class ToDoRepository extends BaseToDoRepository {
  BaseRemoteDataSource remoteDataSource;

  ToDoRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ToDo>>> getToDos() async {
    final result = await remoteDataSource.getToDo();

    try {
      print("*-* " *25);
      print(result);
      print("*-* " *25);
      return Right(result);
    } on ServerException catch(e) {
      return const Left(ServerFailure("This Error When Get Todo Tasks"));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    final result = await remoteDataSource.getUsers();

    try {
      print("===" *25);
      print(result);
      print("===" *25);
      return Right(result);
    } on ServerException catch(e) {
      return const Left(ServerFailure("This Error When Get Users"));
    }
  }
}