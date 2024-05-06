import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/data/local/repository/local_repository.dart';
import 'package:clubhub/data/local/sql/persons_table.dart';

class LocalRepositoryImpl implements LocalRepository {
  LocalRepositoryImpl({required this.personsDatabase});

  final PersonsDatabase personsDatabase;

  @override
  Future<List<Person>> getPersons() async {
    return await personsDatabase.getPersons();
  }

  @override
  Future<void> addPersons(List<Person> persons) async {
    await personsDatabase.addPersons(persons);
  }

  @override
  Future<Person> getPerson(String id) async {
    final person = personsDatabase.getPerson(id);
    return person;
  }
}
