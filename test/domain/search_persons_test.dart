import 'package:clubhub/core/analytics/app_tracking.dart';
import 'package:clubhub/domain/search_persons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/local/models/person.dart';

class MockDataSource extends Mock implements DataSource {}

class MockAppTracking extends Mock implements AppTracking {}

void main() {
  late SearchPersons searchPersons;
  late MockDataSource mockDataSource;
  late List<Person> tPersons;

  setUp(() {
    mockDataSource = MockDataSource();
    searchPersons = SearchPersons(dataSource: mockDataSource);
    tPersons = [
      Person(
          name: 'John Doe',
          age: 30,
          id: "1",
          email: "",
          phone: "",
          surname: "",
          cell: "",
          imageURL: ""),
      Person(
          name: 'Jane Doe',
          age: 25,
          id: "2",
          email: "",
          phone: "",
          surname: "",
          cell: "",
          imageURL: ""),
      Person(
          name: 'Alice Johnson',
          age: 28,
          id: "3",
          email: "",
          phone: "",
          surname: "",
          cell: "",
          imageURL: "")
    ];
  });

  test('should return filtered list of persons when the query matches',
      () async {
    when(() => mockDataSource.getPersons())
        .thenAnswer((_) async => Right(tPersons));
    const String query = "Doe";

    final result = await searchPersons(const SearchPersonsParams(query: query));

    expect(result.getOrElse(() => []), [tPersons[0], tPersons[1]]);
    verify(() => mockDataSource.getPersons()).called(1);
    verifyNoMoreInteractions(mockDataSource);
  });

  test('should return empty list when no persons match the query', () async {
    // Arrange
    when(() => mockDataSource.getPersons())
        .thenAnswer((_) async => Right(tPersons));
    const String query = "Smith";

    // Act
    final result = await searchPersons(const SearchPersonsParams(query: query));

    // Assert
    expect(result.getOrElse(() => []), isEmpty);
    verify(() => mockDataSource.getPersons()).called(1);
    verifyNoMoreInteractions(mockDataSource);
  });
  test('should return a failure when the call to data source is unsuccessful',
      () async {
    const AppFailure tFailure = AppFailure(errorMessage: "An error occurred");
    when(() => mockDataSource.getPersons()).thenAnswer(
        (_) async => const Left<AppFailure, List<Person>>(tFailure));

    final result =
        await searchPersons(const SearchPersonsParams(query: "query"));

    expect(result, equals(const Left<AppFailure, List<Person>>(tFailure)));
    verify(() => mockDataSource.getPersons()).called(1);
  });
}
