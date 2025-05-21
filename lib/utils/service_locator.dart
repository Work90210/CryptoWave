import 'package:cryptowave/repositories/coin_details_repository.dart';
import 'package:cryptowave/repositories/coin_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setupDependencies() {
  // Register external dependencies
  getIt
    ..registerLazySingleton<http.Client>(http.Client.new)
    // Register services
    ..registerLazySingleton<CoinRepository>(CoinRepository.new)
    ..registerLazySingleton<CoinDetailsRepository>(CoinDetailsRepository.new);
}
