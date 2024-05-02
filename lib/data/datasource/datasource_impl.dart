import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/data/remote/repository/remote_repository.dart';
import 'package:clubhub/data/wrappers/person_wrapper.dart';
import 'package:dartz/dartz.dart';

class DataSourceImpl implements DataSource {
  DataSourceImpl({required this.remoteRepository});

  final RemoteRepository remoteRepository;

  @override
  Future<Either<AppFailure, List<Person>>> getPersons() async {
    final result = await remoteRepository.getPersons();
    PersonWraper wrapper = PersonWraper();

    return result.fold(
      (failure) => Left(AppFailure(errorMessage: failure.errorMessage)),
      (persons) => Right(persons.map((e) => wrapper.transform(e)).toList()),
    );
  }
}
