import 'package:get_it/get_it.dart';
import 'package:movie_review/core/networking_service/network_service.dart';
import 'package:movie_review/core/repo/movie_repo.dart';

final serviceLocator = GetIt.instance;
Future<void> locatorSetUp() async {
  // serviceLocator.registerLazySingleton<DatabaseService>(
  //   () => DatabaseServiceImpl(),
  // );
  serviceLocator
      .registerLazySingleton<NetworkService>(() => NetworkClientImpl());

  serviceLocator.registerLazySingleton<MovieRepo>(() => MovieRepoImpl());

  // serviceLocator.registerLazySingleton<MovieViewmodel>(() => MovieViewmodel());
}
