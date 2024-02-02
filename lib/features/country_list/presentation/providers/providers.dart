import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_countries/features/country_list/domain/providers/providers.dart';
import 'package:rest_countries/features/country_list/presentation/state_models/country_list.dart';
import 'package:rest_countries/features/country_list/presentation/state_notifiers/country_list.dart';

final countryListNotifierProvider =
    StateNotifierProvider.autoDispose<CountryListNotifier, CountryListState>(
  (ref) => CountryListNotifier(
    ref: ref,
    repository: ref.watch(countryListRepositoryProvider),
  ),
);
