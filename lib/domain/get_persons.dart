import 'package:clubhub/core/analytics/app_tracking.dart';
import 'package:clubhub/core/base/base_use_case.dart';
import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:dartz/dartz.dart';

class GetPersons implements BaseUseCase<List<Person>, NoParams> {
  GetPersons({required this.dataSource});

  final DataSource dataSource;

  @override
  Future<Either<AppFailure, List<Person>>> call(NoParams params) async {
    try {
      final result = await dataSource.getPersons();

      return result.fold(
        (failure) => Left(AppFailure(errorMessage: failure.errorMessage)),
        (persons) => Right(persons),
      );
    } catch (e) {
      AppTracking.logError(
          errorMessage: "Error: $e", stackTrace: StackTrace.current);
      return Left(AppFailure(errorMessage: e.toString()));
    }
  }
}
