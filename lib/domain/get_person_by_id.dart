import 'package:clubhub/core/analytics/app_tracking.dart';
import 'package:clubhub/core/base/base_use_case.dart';
import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPersonById implements BaseUseCase<Person, GetPersonByIdParams> {
  GetPersonById({required this.dataSource});

  final DataSource dataSource;

  @override
  Future<Either<AppFailure, Person>> call(GetPersonByIdParams params) async {
    try {
      final result = await dataSource.getPersonById(params.id);
      return result;
    } catch (e) {
      AppTracking.logError(
          errorMessage: "Error: $e", stackTrace: StackTrace.current);
      return Left(AppFailure(errorMessage: e.toString()));
    }
  }
}

class GetPersonByIdParams extends Equatable {
  const GetPersonByIdParams({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}
