import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/core/error/logger.dart';
import 'package:clubhub/core/error/success.dart';
import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/data/local/repository/local_repository.dart';
import 'package:clubhub/data/remote/repository/remote_repository.dart';
import 'package:clubhub/data/wrappers/person_wrapper.dart';
import 'package:dartz/dartz.dart';

class DataSourceImpl implements DataSource {
  DataSourceImpl(
      {required this.remoteRepository, required this.localRepository});

  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;

  @override
  Future<Either<AppFailure, List<Person>>> getPersons() async {
    try {
      List<Person> localPersons = await localRepository.getPersons();

      if (localPersons.isNotEmpty) {
        return Right(localPersons);
      }

      final result = await _fetchPersons();
      return await result.fold((failure) => Left(failure), (success) async {
        final result = await localRepository.getPersons();
        return Right(result);
      });
    } catch (e) {
      Logger.logError(
          errorMessage: "Error: $e", stackTrace: StackTrace.current);
      return Left(AppFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<AppFailure, Success>> _fetchPersons() async {
    try {
      final result = await remoteRepository.getPersons();
      PersonWraper wrapper = PersonWraper();

      return await result.fold(
        (failure) => Left(failure),
        (personModels) async {
          List<Person> persons =
              personModels.map((e) => wrapper.transform(e)).toList();
          await localRepository.addPersons(persons);

          return Right(Success());
        },
      );
    } catch (e) {
      Logger.logError(
          errorMessage: "Error: $e", stackTrace: StackTrace.current);
      return Left(AppFailure(errorMessage: e.toString()));
    }
  }
}
