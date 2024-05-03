import 'package:clubhub/data/local/models/person.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class PersonsDatabase {
  static Database? _database;

  PersonsDatabase._init();

  static final PersonsDatabase instance = PersonsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('persons.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE persons(id TEXT PRIMARY KEY, name TEXT, surname TEXT, email TEXT, phone TEXT, cell TEXT, imageURL TEXT, age INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertPerson(Person person) async {
    final db = await database;
    Map<String, dynamic> personMap = person.toMap();
    await db.insert(
      'persons',
      personMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletePerson(Person person) async {
    final db = await database;
    await db.delete(
      'persons',
      where: "id = ?",
      whereArgs: [person.id],
    );
  }

  Future<void> addPersons(List<Person> persons) async {
    final db = await database;
    final batch = db.batch();
    for (final person in persons) {
      batch.insert('persons', person.toMap());
    }
    await batch.commit(noResult: true);
  }

  Future<List<Person>> getPersons() async {
    final List<Map<String, dynamic>> maps = await _database!.query('persons');

    return List.generate(maps.length, (i) {
      return Person(
        id: maps[i]['id'],
        name: maps[i]['name'],
        surname: maps[i]['surname'],
        email: maps[i]['email'],
        phone: maps[i]['phone'],
        cell: maps[i]['cell'],
        age: maps[i]['age'],
        imageURL: maps[i]['imageURL'],
      );
    });
  }
}
