import 'package:clubhub/data/local/models/person.dart';

abstract class LocalRepository {
  Future<void> savePerson(Person person);
  Future<void> deletePerson(int id);
  Future<void> updatePerson(Person person);
  Future<void> getPersons();
}
