import 'package:clubhub/core/analytics/app_tracking.dart';
import 'package:clubhub/core/base/base_use_case.dart';
import 'package:clubhub/domain/get_persons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/local/models/person.dart';

class MockDataSource extends Mock implements DataSource {}

class MockAppTracking extends Mock implements AppTracking {}

class MockPerson extends Mock implements Person {}

void main() {
  late GetPersons getPersons;
  late Person mockPerson;
  late MockDataSource mockDataSource;
  late List<Person> tPersons;

  setUp(() {
    mockDataSource = MockDataSource();
    getPersons = GetPersons(dataSource: mockDataSource);
    mockPerson = MockPerson();
    tPersons = [mockPerson];
  });

  test(
      'should return a list of persons when the call to data source is successful',
      () async {
    when(() => mockDataSource.getPersons())
        .thenAnswer((_) async => Right(tPersons));

    final result = await getPersons(NoParams());

    expect(result, Right(tPersons));
    verify(() => mockDataSource.getPersons()).called(1);
    verifyNoMoreInteractions(mockDataSource);
  });

  test('should return a failure when the call to data source is unsuccessful',
      () async {
    const AppFailure tFailure = AppFailure(errorMessage: "An error occurred");
    when(() => mockDataSource.getPersons())
        .thenAnswer((_) async => const Left(tFailure));

    final result = await mockDataSource.getPersons();

    expect(result, const Left(tFailure));
    verify(() => mockDataSource.getPersons()).called(1);
  });
}
