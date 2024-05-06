import 'package:clubhub/core/base/base_use_case.dart';
import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/core/analytics/app_tracking.dart';
import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchPersons implements BaseUseCase<List<Person>, SearchPersonsParams> {
  SearchPersons({required this.dataSource});

  final DataSource dataSource;

  @override
  Future<Either<AppFailure, List<Person>>> call(
      SearchPersonsParams params) async {
    try {
      final personsResponse = await dataSource.getPersons();

      return personsResponse.fold(
          (failure) => Left(AppFailure(errorMessage: failure.errorMessage)),
          (persons) {
        List<Person> filteredList = persons
            .where((element) =>
                element.name.toLowerCase().contains(params.query.toLowerCase()))
            .toList();
        return Right(filteredList);
      });
    } catch (e) {
      AppTracking.logError(
          errorMessage: "Error: $e", stackTrace: StackTrace.current);
      return Left(AppFailure(errorMessage: e.toString()));
    }
  }
}

class SearchPersonsParams extends Equatable {
  final String query;

  const SearchPersonsParams({required this.query});

  @override
  List<Object?> get props => [query];
}
