import 'package:either_dart/either.dart';
import 'package:todo_app/domain/repository/base_todo%20_repository.dart';

import '../../core/error/failure.dart';
import '../entities/user_entities.dart';

class GetUsersUseCase {
  BaseToDoRepository baseToDoRepository;

  GetUsersUseCase(this.baseToDoRepository);

  Future<Either<Failure, List<User>>> call() async {
    return await baseToDoRepository.getUsers();
  }
}