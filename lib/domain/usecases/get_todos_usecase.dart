import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/todo_entities.dart';
import 'package:todo_app/domain/repository/base_todo%20_repository.dart';

import '../../core/error/failure.dart';

class GetToDosUseCase {
  BaseToDoRepository baseToDoRepository;

  GetToDosUseCase(this.baseToDoRepository);

  Future<Either<Failure, List<ToDo>>> call() async {
    return await baseToDoRepository.getToDos();
  }
}