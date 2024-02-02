import 'package:dio/dio.dart';
import 'package:rest_countries/features/country_list/data/sources/country_list.dart';
import 'package:rest_countries/features/country_list/domain/models/country.dart';

import '../../../../core/utilities/constants/endpoints.dart';
import '../../../../core/utilities/enums.dart';
import '../../../../core/utilities/functions/http_request.dart';

class CountryListSourceImpl extends CountryListSource {
  @override
  Future<List<CountryModel?>?> getCountryList() async {
    final Response response = await httpRequest(
      httpRequestType: HttpRequestType.get,
      path: ProjectApiEndpoints.allCountry,
    );
    if (response.data != null) {
      return (response.data as List)
          .map((country) => CountryModel.fromJson(country))
          .toList();
    }
    return [];
  }
}
