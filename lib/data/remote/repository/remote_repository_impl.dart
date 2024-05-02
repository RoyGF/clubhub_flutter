import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/remote/models/person_model.dart';
import 'package:clubhub/data/remote/repository/remote_repository.dart';
import 'package:dartz/dartz.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  @override
  Future<Either<Failure, List<PersonModel>>> getPersons() {
    throw UnimplementedError();
  }
}
