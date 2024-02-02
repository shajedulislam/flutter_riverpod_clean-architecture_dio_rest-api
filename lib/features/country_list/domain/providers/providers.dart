import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_countries/features/country_list/data/repositories/country_list_impl.dart';
import 'package:rest_countries/features/country_list/data/sources/country_list.dart';
import 'package:rest_countries/features/country_list/data/sources/country_list_impl.dart';
import 'package:rest_countries/features/country_list/domain/repositories/country_list.dart';

final countryListSourceProvider = Provider<CountryListSource>(
  ((ref) => CountryListSourceImpl()),
);

final countryListRepositoryProvider = Provider<CountryListRepository>(
  (ref) => CountryListRepositoryImpl(
    source: ref.watch(countryListSourceProvider),
  ),
);
