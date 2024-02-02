import 'package:flutter/material.dart';
import 'package:rest_countries/features/country_list/presentation/views/country_list_screen.dart';

import 'core/services/navigation.dart';
import 'core/utilities/singleton.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Countries",
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().globalNavigatorKey,
      scaffoldMessengerKey:
          locator<NavigationService>().globalScaffoldMessengerKey,
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: widget!,
        );
      },
      home: const CountryListScreen(),
    );
  }
}
