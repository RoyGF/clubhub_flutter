import 'package:clubhub/data/datasource/datasource.dart';
import 'package:clubhub/data/datasource/datasource_impl.dart';
import 'package:clubhub/data/local/repository/local_repository.dart';
import 'package:clubhub/data/local/repository/local_repository_impl.dart';
import 'package:clubhub/data/local/sql/persons_table.dart';
import 'package:clubhub/data/remote/repository/remote_repository.dart';
import 'package:clubhub/data/remote/repository/remote_repository_impl.dart';
import 'package:clubhub/domain/get_person_by_id.dart';
import 'package:clubhub/domain/get_persons.dart';
import 'package:clubhub/domain/search_persons.dart';
import 'package:clubhub/presentation/detail/cubit/detail_cubit.dart';
import 'package:clubhub/presentation/home/cubit/home_cubit.dart';
import 'package:clubhub/presentation/search/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Reposotories

  sl.registerLazySingleton<RemoteRepository>(() => RemoteRepositoryImpl());
  sl.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(personsDatabase: sl()));

  //Data Sources

  sl.registerLazySingleton<DataSource>(
    () => DataSourceImpl(
      remoteRepository: sl(),
      localRepository: sl(),
    ),
  );

  // Database
  sl.registerLazySingleton<PersonsDatabase>(() => PersonsDatabase.instance);

  // Use Cases

  sl.registerLazySingleton<GetPersons>(
    () => GetPersons(
      dataSource: sl(),
    ),
  );

  sl.registerLazySingleton<SearchPersons>(
    () => SearchPersons(
      dataSource: sl(),
    ),
  );

  sl.registerLazySingleton<GetPersonById>(
    () => GetPersonById(
      dataSource: sl(),
    ),
  );

  // Cubits
  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      getPersons: sl(),
    ),
  );

  sl.registerFactory<SearchCubit>(
    () => SearchCubit(
      searchPersons: sl(),
    ),
  );

  sl.registerFactory<DetailCubit>(
    () => DetailCubit(
      getPersonByid: sl(),
    ),
  );
}
