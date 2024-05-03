import 'package:clubhub/core/error/failures.dart';
import 'package:clubhub/data/remote/models/person_model.dart';
import 'package:clubhub/data/remote/repository/remote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  static final _options = BaseOptions(
    baseUrl: "https://randomuser.me/api/?results=500&seed=hello",
  );

  final Dio _dio = Dio(_options);

  @override
  Future<Either<AppFailure, List<PersonModel>>> getPersons() async {
    final response = await _dio.get("");

    if (response.statusCode == 200) {
      final data = response.data;
      final results = data["results"] as List;
      final persons = results.map((e) => PersonModel.fromJson(e)).toList();
      return Right(persons);
    } else {
      return Left(AppFailure(errorMessage: "Error"));
    }
  }
}
