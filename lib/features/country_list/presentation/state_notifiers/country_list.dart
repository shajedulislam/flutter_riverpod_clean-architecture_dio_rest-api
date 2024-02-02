import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_countries/features/country_list/domain/models/country.dart';
import 'package:rest_countries/features/country_list/domain/repositories/country_list.dart';
import 'package:rest_countries/features/country_list/presentation/state_models/country_list.dart';

import '../../../../core/utilities/constants/strings.dart';
import '../../../../core/utilities/enums.dart';
import '../../../../core/utilities/functions/prints.dart';

class CountryListNotifier extends StateNotifier<CountryListState> {
  Ref ref;
  CountryListRepository repository;
  CountryListNotifier({
    required this.ref,
    required this.repository,
  }) : super(CountryListState());

  getCountryList() async {
    try {
      final List<CountryModel?>? data = await repository.getCountryList();
      if (data != null && data.isNotEmpty) {
        state = state.copyWith(
          data: data,
          dataState: DataState.loaded,
        );
      } else {
        state = state.copyWith(
          dataState: DataState.empty,
          message: ProjectStrings.wentWrong,
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
    state = CountryListState();
  }
}
