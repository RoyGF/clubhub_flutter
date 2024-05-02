import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:dartz/dartz.dart';

class DataSourceImpl implements DataSource {
  @override
  Either<Failure, Person> getPerson(int id) {
    // TODO: implement getPerson
    throw UnimplementedError();
  }

  @override
  Either<Failure, List<Person>> getPersons() {
    // TODO: implement getPersons
    throw UnimplementedError();
  }
}
