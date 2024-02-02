import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_countries/app.dart';

import 'core/services/dio.dart';
import 'core/utilities/singleton.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await registerSingletons();
  await locator<DioService>().create("https://restcountries.com");

  runApp(const ProviderScope(child: MyApp()));
}
