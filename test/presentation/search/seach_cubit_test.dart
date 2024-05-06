import 'package:bloc_test/bloc_test.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/domain/search_persons.dart';
import 'package:clubhub/presentation/search/cubit/search_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchPersons extends Mock implements SearchPersons {}

class MockPerson extends Mock implements Person {}

class MockSearchCubit extends MockCubit<SearchState> implements SearchCubit {}

void main() {
  group(
    'SearchPersons',
    () {
      late SearchPersons searchPersons;
      late SearchPersonsParams params;
      late MockPerson mockPerson;

      setUp(() {
        searchPersons = MockSearchPersons();
        mockPerson = MockPerson();
        params = const SearchPersonsParams(query: "query");

        when(() => searchPersons.call(params))
            .thenAnswer((_) async => Right([mockPerson]));
      });

      blocTest<SearchCubit, SearchState>(
        'emits [SearchState] when search is called',
        build: () => SearchCubit(searchPersons: searchPersons),
        act: (cubit) => cubit.search("query"),
        expect: () => [
          const SearchState(isLoading: true),
          SearchState(isLoading: false, persons: [mockPerson]),
        ],
      );
    },
  );
}
