import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';
import '../network/api_client.dart';
import '../storage/storage_service.dart';
import '../services/connectivity_service.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDependencies() async {
  // ── Core ───────────────────────────────────────────────
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  sl.registerLazySingleton<StorageService>(() => StorageService());
  sl.registerLazySingleton<ConnectivityService>(() => ConnectivityService());

  // ── Features — uncomment as you build ─────────────────
  //
  // AUTH
  // sl.registerLazySingleton<AuthService>(() => AuthService(sl<ApiClient>()));
  // sl.registerFactory<AuthController>(() => AuthController(sl()));
  //
  // HOME
  // sl.registerLazySingleton<HomeService>(() => HomeService(sl<ApiClient>()));
  // sl.registerFactory<HomeController>(() => HomeController(sl()));
}
