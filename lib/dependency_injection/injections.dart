import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/datasource/datasource_impl.dart';
import 'package:clubhub/data/local/repository/local_repository.dart';
import 'package:clubhub/data/local/repository/local_repository_impl.dart';
import 'package:clubhub/data/remote/repository/remote_repository.dart';
import 'package:clubhub/data/remote/repository/remote_repository_impl.dart';
import 'package:clubhub/domain/get_persons.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Reposotories

  sl.registerLazySingleton<RemoteRepository>(() => RemoteRepositoryImpl());
  sl.registerLazySingleton<LocalRepository>(() => LocalRepositoryImpl());

  //Data Sources

  sl.registerLazySingleton<DataSource>(
      () => DataSourceImpl(remoteRepository: sl()));

  // Use Cases

  sl.registerLazySingleton<GetPersons>(() => GetPersons(dataSource: sl()));

  // Cubits
}
