import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/remote/models/person_model.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteRepository {
  Future<Either<AppFailure, List<PersonModel>>> getPersons();
}
