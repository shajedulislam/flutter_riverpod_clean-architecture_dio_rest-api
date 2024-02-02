import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_countries/features/country_details/data/repositories/country_details_impl.dart';
import 'package:rest_countries/features/country_details/data/sources/country_details.dart';
import 'package:rest_countries/features/country_details/data/sources/country_details_impl.dart';
import 'package:rest_countries/features/country_details/domain/repositories/country_details.dart';

final countryDetailsSourceProvider = Provider<CountryDetailsSource>(
  ((ref) => CountryDetailsSourceImpl()),
);

final countryDetailsRepositoryProvider = Provider<CountryDetailsRepository>(
  (ref) => CountryDetailsRepositoryImpl(
    source: ref.watch(countryDetailsSourceProvider),
  ),
);
