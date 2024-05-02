import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:dartz/dartz.dart';

abstract class DataSource {
  Either<Failure, Person> getPerson(int id);
  Either<Failure, List<Person>> getPersons();
}
