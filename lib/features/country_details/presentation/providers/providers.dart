import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_countries/features/country_details/domain/providers/providers.dart';
import 'package:rest_countries/features/country_details/presentation/state_models/country_details.dart';

import '../state_notifiers/country_details.dart';

final countryDetailstNotifierProvider = StateNotifierProvider.autoDispose<
    CountryDetailsNotifier, CountryDetailsState>(
  (ref) => CountryDetailsNotifier(
    ref: ref,
    repository: ref.watch(countryDetailsRepositoryProvider),
  ),
);
