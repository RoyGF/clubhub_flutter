import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:dartz/dartz.dart';

abstract class DataSource {
  Future<Either<AppFailure, List<Person>>> getPersons();
  Future<Either<AppFailure, Person>> getPersonById(String id);
}
