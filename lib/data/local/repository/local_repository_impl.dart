import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/data/local/repository/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  @override
  Future<void> deletePerson(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> getPersons() {
    throw UnimplementedError();
  }

  @override
  Future<void> savePerson(Person person) {
    throw UnimplementedError();
  }

  @override
  Future<void> updatePerson(Person person) {
    throw UnimplementedError();
  }
}
