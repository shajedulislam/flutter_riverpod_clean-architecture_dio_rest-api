import 'package:rest_countries/features/country_list/domain/models/country.dart';

import '../../../../../core/utilities/enums.dart';

class CountryListState {
  final DataState dataState;
  final List<CountryModel?>? data;
  final String? message;

  CountryListState({
    this.dataState = DataState.initial,
    this.data,
    this.message,
  });

  CountryListState copyWith({
    DataState? dataState,
    List<CountryModel?>? data,
    String? message,
  }) {
    return CountryListState(
      dataState: dataState ?? this.dataState,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
