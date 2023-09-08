import 'package:dio/dio.dart';
import 'package:todo_app/core/error/exceptions.dart';
import 'package:todo_app/core/network/api_constance.dart';

import '../models/todo_model.dart';
import '../models/users_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<UsersModel>> getUsers();

  Future<List<ToDoModel>> getToDo();
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<ToDoModel>> getToDo() async {
    final response = await Dio().get(ApiConstance.todoUrl);

    if (response.statusCode == 200) {
      return List<ToDoModel>.from(
        (response.data as List).map(
          (e) => ToDoModel.from(e),
        ),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UsersModel>> getUsers() async {
    final response = await Dio().get(ApiConstance.userUrl);

    if (response.statusCode == 200) {
      return List<UsersModel>.from(
        (response.data as List).map(
              (e) => UsersModel.from(e),
        ),
      );
    } else {
      throw ServerException();
    }
  }
}
