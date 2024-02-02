import 'package:rest_countries/features/country_details/domain/models/country_details.dart';

import '../../../../core/utilities/enums.dart';

class CountryDetailsState {
  final DataState dataState;
  final CountryDetailsModel? data;
  final String? message;

  CountryDetailsState({
    this.dataState = DataState.initial,
    this.data,
    this.message,
  });

  CountryDetailsState copyWith({
    DataState? dataState,
    CountryDetailsModel? data,
    String? message,
  }) {
    return CountryDetailsState(
      dataState: dataState ?? this.dataState,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
