import 'package:clubhub/data/local/models/person.dart';

abstract class LocalRepository {
  Future<List<Person>> getPersons();
  Future<void> addPersons(List<Person> persons);
  Future<Person> getPerson(String id);
}
