import 'package:bloc_test/bloc_test.dart';
import 'package:clubhub/core/base/base_use_case.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/domain/get_persons.dart';
import 'package:clubhub/presentation/home/cubit/home_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPersons extends Mock implements GetPersons {}

class MockPerson extends Mock implements Person {}

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  group(
    'GetPersons',
    () {
      late GetPersons getPersons;
      late MockPerson mockPerson;

      setUp(() {
        getPersons = MockGetPersons();
        mockPerson = MockPerson();

        when(() => getPersons.call(NoParams()))
            .thenAnswer((_) async => Right([mockPerson]));
      });

      blocTest<HomeCubit, HomeState>(
        'emits [HomeState] when init is called',
        build: () => HomeCubit(getPersons: getPersons),
        act: (cubit) => cubit.init(),
        expect: () => [
          const HomeState(isLoading: true),
          HomeState(isLoading: false, persons: [mockPerson]),
        ],
      );
    },
  );
}
