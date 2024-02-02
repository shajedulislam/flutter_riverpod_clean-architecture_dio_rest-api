import 'package:rest_countries/features/country_details/domain/models/country_details.dart';

abstract class CountryDetailsRepository {
  Future<CountryDetailsModel?> getCountryDetails(String alpha);
}
