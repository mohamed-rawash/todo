import 'package:either_dart/either.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/domain/entities/todo_entities.dart';

import '../entities/user_entities.dart';

abstract class BaseToDoRepository {

  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, List<ToDo>>> getToDos();

}