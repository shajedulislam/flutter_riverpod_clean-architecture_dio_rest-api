import 'package:dio/dio.dart';
import 'package:rest_countries/core/utilities/constants/endpoints.dart';
import 'package:rest_countries/features/country_details/domain/models/country_details.dart';

import '../../../../core/utilities/enums.dart';
import '../../../../core/utilities/functions/http_request.dart';
import 'country_details.dart';

class CountryDetailsSourceImpl extends CountryDetailsSource {
  @override
  Future<CountryDetailsModel?> getCountryDetails(String alpha) async {
    final Response response = await httpRequest(
      httpRequestType: HttpRequestType.get,
      path: "${ProjectApiEndpoints.detailByCode}$alpha",
    );
    if (response.data != null && response.data is List) {
      return CountryDetailsModel.fromJson((response.data as List).first);
    }
    return null;
  }
}
