import 'package:clubhub/core/analytics/app_tracking.dart';
import 'package:clubhub/domain/get_person_by_id.dart';
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
  late GetPersonById getPersonById;
  late MockDataSource mockDataSource;
  late Person tPerson;
  late String tId;

  setUp(() {
    mockDataSource = MockDataSource();
    getPersonById = GetPersonById(dataSource: mockDataSource);
    tPerson = MockPerson();
    tId = "123";
  });

  test('should return a person when the call to data source is successful',
      () async {
    when(() => mockDataSource.getPersonById(any()))
        .thenAnswer((_) async => Right(tPerson));

    final result = await getPersonById(GetPersonByIdParams(id: tId));

    expect(result, Right(tPerson));
    verify(() => mockDataSource.getPersonById(tId)).called(1);
    verifyNoMoreInteractions(mockDataSource);
  });

  test('should return a failure when the call to data source is unsuccessful',
      () async {
    const AppFailure tFailure = AppFailure(errorMessage: "An error occurred");
    when(() => mockDataSource.getPersonById(any()))
        .thenAnswer((_) async => const Left(tFailure));

    final result = await getPersonById(GetPersonByIdParams(id: tId));

    expect(result, const Left(tFailure));
    verify(() => mockDataSource.getPersonById(tId)).called(1);
  });
}
