import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}