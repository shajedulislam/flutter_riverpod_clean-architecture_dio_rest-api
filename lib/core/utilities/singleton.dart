import 'package:get_it/get_it.dart';

import '../services/dio.dart';
import '../services/navigation.dart';

GetIt locator = GetIt.instance;

Future<void> registerSingletons() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DioService());
}
