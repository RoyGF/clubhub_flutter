import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/domain/get_person_by_id.dart';
import 'package:clubhub/presentation/detail/cubit/detail_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:mocktail/mocktail.dart';

class MockGetPersonById extends Mock implements GetPersonById {}

class MockPerson extends Mock implements Person {}

class MockDetailCubit extends MockCubit<DetailState> implements DetailCubit {}

void main() {
  group(
    'GetPersonById',
    () {
      late GetPersonById getPersonById;
      late GetPersonByIdParams params;
      late MockPerson mockPerson;

      setUp(() {
        getPersonById = MockGetPersonById();
        mockPerson = MockPerson();
        params = const GetPersonByIdParams(id: "id");

        when(() => getPersonById.call(params))
            .thenAnswer((_) async => Right(mockPerson));
      });

      blocTest<DetailCubit, DetailState>(
        'emits [DetailState] when init is called',
        build: () => DetailCubit(getPersonByid: getPersonById),
        act: (cubit) => cubit.init("id"),
        expect: () => [
          const DetailState(isLoading: true),
          DetailState(isLoading: false, person: mockPerson),
        ],
      );
    },
  );
}
