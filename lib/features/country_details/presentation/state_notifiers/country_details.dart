import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_countries/features/country_details/domain/models/country_details.dart';
import 'package:rest_countries/features/country_details/domain/repositories/country_details.dart';
import 'package:rest_countries/features/country_details/presentation/state_models/country_details.dart';

import '../../../../core/utilities/constants/strings.dart';
import '../../../../core/utilities/enums.dart';
import '../../../../core/utilities/functions/prints.dart';

class CountryDetailsNotifier extends StateNotifier<CountryDetailsState> {
  Ref ref;
  CountryDetailsRepository repository;
  CountryDetailsNotifier({
    required this.ref,
    required this.repository,
  }) : super(CountryDetailsState());

  getCountryDetails({required String alpha}) async {
    try {
      final CountryDetailsModel? data =
          await repository.getCountryDetails(alpha);
      if (data != null) {
        state = state.copyWith(
          data: data,
          dataState: DataState.loaded,
        );
      } else {
        state = state.copyWith(
          dataState: DataState.empty,
          message: ProjectStrings.noDataFound,
        );
      }
    } catch (e) {
      printer(e);
      state = state.copyWith(
        dataState: DataState.error,
        message: ProjectStrings.wentWrong,
      );
    }
  }

  Future<void> resetState() async {
    state = CountryDetailsState();
  }
}
